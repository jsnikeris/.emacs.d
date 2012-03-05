(require 'my-cedet)

(let ((malabar-dir (expand-file-name "malabar" my-init-dir)))
  (if (not (file-directory-p malabar-dir))
      (warn "malabar-mode not installed in %s" malabar-dir)
    (add-to-list 'load-path (expand-file-name "lisp" malabar-dir))
    (require 'malabar-mode)
    (setq malabar-groovy-lib-dir (expand-file-name "lib" malabar-dir))
    (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))))

(provide 'my-malabar)
