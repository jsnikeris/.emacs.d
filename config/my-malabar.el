(defvar my-malabar-dir (expand-file-name "~/src/malabar-mode"))

(when (file-directory-p my-malabar-dir)
  (setq malabar-groovy-lib-dir (expand-file-name "target/lib" my-malabar-dir))
  (setq malabar-groovy-extra-classpath
        (expand-file-name "target/classes" my-malabar-dir))
  (add-to-list 'load-path (expand-file-name "src/main/lisp" my-malabar-dir))
  (require 'malabar-mode)
  (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode)))

(provide 'my-malabar)
