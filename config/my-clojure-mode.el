(require 'my-package)
(require 'my-paredit)

(let ((src-dir (expand-file-name "~/src/clojure-mode")))
  (if (file-readable-p src-dir)
      (add-to-list 'load-path src-dir)
    (my-package-install-package 'clojure-mode)))

(require 'clojure-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)

(provide 'my-clojure-mode)
