(my-require 'dired-x)

(setq-default dired-omit-mode t)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))

(provide 'my-dired)
