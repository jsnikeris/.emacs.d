(my-require 'dired-x)

(setq-default dired-omit-mode t)
(setq
 dired-omit-files (concat dired-omit-files "\\|^\\..+$")
 dired-listing-switches "-alh"
 dired-recursive-deletes 'always)

(provide 'my-dired)
