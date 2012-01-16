(require 'package)

(defvar my-package-packages
  '(clojure-mode magit)
  "A list of packages to be installed during Emacs initialization.")

(defun my-package-install-packages (packages)
  "Install the provided list of PACKAGES if they're not already."
  (dolist (p packages)
    (when (not (package-installed-p p))
      (package-install p))))

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(package-refresh-contents)
(my-package-install-packages my-package-packages)

(provide 'my-package-config)
