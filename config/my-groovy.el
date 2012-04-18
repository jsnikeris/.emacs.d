(require 'my-package)

(my-package-install-package 'groovy-mode)

(require 'groovy-mode)
(add-to-list 'auto-mode-alist '("\\.groovy\\'" . groovy-mode))

(provide 'my-groovy)
