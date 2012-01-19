(require 'org)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-agenda-files '("~/Documents/things.org"))
(setq org-fast-tag-selection-single-key 'expert)
(setq org-tag-alist
      '(("@read" . 114) ("@phone" . 102) ("@computer" . 99) ("@internet" . 105)
	("@work" . 119) ("@errand" . 101) ("@home" . 104)))
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)")))

(provide 'my-org)
