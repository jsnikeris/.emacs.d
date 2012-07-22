(require 'my-url)

(unless (require 'ert nil t)
  (dolist (filename '("ert.el" "ert-x.el" "ert-tests.el" "ert-x-tests.el"))
    (my-url-write-content
     (concat "https://raw.github.com/ohler/ert/"
             "c619b56c5bc6a866e33787489545b87d79973205/lisp/emacs-lisp/"
             filename)
     (expand-file-name filename my-site-lisp-dir)))
  (require 'ert))

(provide 'my-ert)
