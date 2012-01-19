(require 'package)

(defun my-package-install-package (package)
  "Install the provided PACKAGE if it's not already."
  (when (not (package-installed-p package))
    (package-install package)))

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(provide 'my-package)
