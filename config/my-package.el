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

(mapc (lambda (p) (add-to-list 'package-archives p t))
      '(("marmalade" . "http://marmalade-repo.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

(defun my-package-install (name)
  (unless (package-installed-p name)
    (package-install name)))

(defun my-require (feature)
  (unless (require feature nil t)
    (let ((src-dir (expand-file-name (symbol-name feature) my-src-dir)))
      (if (not (file-readable-p src-dir))
          (my-package-install feature)
        (add-to-list 'load-path src-dir)
        (require feature)))))

(defun my-package-dir (package)
  (let ((pkg-desc (cdr (assq package package-alist))))
    (when pkg-desc
      (package--dir (symbol-name package)
                    (package-version-join (package-desc-vers pkg-desc))))))

(package-refresh-contents)
(package-initialize)

(provide 'my-package)
