(require 'my-package)

(my-package-install-package 'quack)
(require 'quack)

(add-to-list auto-mode-alist '("\\.rkt$" . scheme-mode))

(provide 'my-scheme-mode)
