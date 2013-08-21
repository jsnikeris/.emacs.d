(my-require 'my-magit)
(my-require 'my-nxml)

(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-c s") 'magit-status)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c p") 'my-pretty-print-xml-buffer)

(provide 'my-keys)
