(require 'my-package)
(require 'my-paredit)

(my-package-install-package 'clojure-mode)

(add-hook 'clojure-mode-hook 'paredit-mode)

(provide 'my-clojure-mode)
