(unless (require 'package nil t)
  (require 'my-url)
  (my-url-write-content (concat "http://repo.or.cz/w/emacs.git/blob_plain/"
                                "1a0a666f941c99882093d7bd08ced15033bc3f0c:/"
                                "lisp/emacs-lisp/package.el")
                        (expand-file-name "package.el" my-site-lisp-dir))
  (require 'package))

(defun my-package-install-package (package)
  "Install the provided PACKAGE if it's not already."
  (when (not (package-installed-p package))
    (package-install package)))

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(provide 'my-package)
