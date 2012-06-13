(require 'my-package)

(my-package-install-package 'paredit)

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)

(provide 'my-paredit)
