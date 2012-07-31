(unless (require 'package nil t)
  (require 'my-url)
  (my-url-write-content
   (concat "http://repo.or.cz/w/emacs.git/blob_plain/"
           "1a0a666f941c99882093d7bd08ced15033bc3f0c:/"
           "lisp/emacs-lisp/package.el")
   (expand-file-name "package.el" my-site-lisp-dir))
  (require 'package))

(defvar my-src-dir (expand-file-name "~/src")
  "Contains source for projects that can be my-required")

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)

(defun my-require (feature)
  (unless (require feature nil t)
    (let ((src-dir (expand-file-name (symbol-name feature) my-src-dir)))
      (cond
       ((file-readable-p src-dir)
        (add-to-list 'load-path src-dir)
        (require feature))
       ((not (package-installed-p feature))
        (package-install feature))))))

(package-refresh-contents)
(package-initialize)

(provide 'my-package)
