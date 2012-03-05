(setq org-agenda-files '("/abelson.snikeris.com:Documents/things.org"))
(setq org-fast-tag-selection-single-key 'expert)
(setq org-tag-alist
      '(("@read" . 114) ("@phone" . 102) ("@computer" . 99) ("@internet" . 105)
	("@work" . 119) ("@errand" . 101) ("@home" . 104)))
(setq org-use-tag-inheritance nil)
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)")))
(setq org-enforce-todo-dependencies t)
(setq org-agenda-dim-blocked-tasks 'invisible)

(require 'org)

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
(define-key org-mode-map (kbd "C-c s") 'my-org-insert-sub-task)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)

(provide 'my-org)
