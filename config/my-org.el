(my-require 'org)

(defun my-org-insert-sub-task ()
  (interactive)
  (let ((parent-deadline (org-get-deadline-time nil))
	(parent-scheduled (org-get-scheduled-time nil)))
    (org-goto-sibling)
    (org-insert-todo-subheading t)
    (when parent-deadline
      (org-deadline nil parent-deadline))
    (when parent-scheduled
      (org-schedule nil parent-scheduled))))

(defun my-remove-empty-drawer-on-clock-out ()
  "Remove empty LOGBOOK drawers on clock out"
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at "LOGBOOK" (point))))

;;; Hooks
(add-hook 'org-clock-out-hook 'my-remove-empty-drawer-on-clock-out 'append)

;;; Files
(setq org-directory (expand-file-name "~/doc"))
(setq org-agenda-files
      (list org-directory (expand-file-name "comcast" org-directory)))
(setq org-default-notes-file (expand-file-name "refile.org" org-directory))
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

;;; Agenda
(setq org-agenda-dim-blocked-tasks 'invisible)
(setq org-agenda-start-on-weekday nil)

;;; Task States
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
        (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELED(c@/!)")))
(setq org-treat-S-cursor-todo-selection-as-state-change nil)
(setq org-enforce-todo-dependencies t)
(setq org-todo-state-tags-triggers
      '(("CANCELLED" ("CANCELLED" . t))
        ("WAITING" ("WAITING" . t))
        ("HOLD" ("WAITING" . t) ("HOLD" . t))
        (done ("WAITING") ("HOLD"))
        ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
        ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
        ("DONE" ("WAITING") ("CANCELLED") ("HOLD"))))

;;; Capture
(setq org-capture-templates
  '(("t" "todo" entry (file "")
     "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
    ("r" "respond" entry (file "")
     "* TODO Respond to %:from on %:subject\n%U\n%a\n"
     :clock-in t :clock-resume t :immediate-finish t)
    ("n" "note" entry (file "")
     "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
    ("j" "Journal" entry
     (file+datetree (expand-file-name "diary.org" org-directory))
     "* %?\n%U\n" :clock-in t :clock-resume t)
    ("h" "Habit" entry (file "")
     "* NEXT %?\n%U\n%a\nSCHEDULED: %t .+1d/3d\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")))

;;; Tags
(setq org-fast-tag-selection-single-key 'expert)
(setq org-tag-alist
      '(("@read" . 114) ("@phone" . 102) ("@computer" . 99) ("@internet" . 105)
	("@work" . 119) ("@errand" . 101) ("@home" . 104)))
(setq org-use-tag-inheritance nil)

;;; Keybindings
(define-key org-mode-map (kbd "C-c t") 'my-org-insert-sub-task)

(provide 'my-org)
