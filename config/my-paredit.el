(require 'my-package)

(my-package-install-package 'paredit)

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)

(eval-after-load "paredit"
  '(progn
     (define-key paredit-mode-map (kbd "M-[") 'paredit-wrap-square)
     (define-key paredit-mode-map (kbd "M-{") 'paredit-wrap-curly)))

(add-hook 'clojure-mode-hook 'paredit-mode)

(provide 'my-paredit)
