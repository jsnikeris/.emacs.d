(defvar my-init-dir (file-name-directory load-file-name)
  "The directory under which Emacs' initialization files reside.")

(defvar my-config-dir (expand-file-name "config" my-init-dir)
  "The directory under which configuration for various packages resides.")

(defvar my-site-lisp-dir (expand-file-name "site-lisp" my-init-dir)
  "Contains elisp files developed by others.
Does not include packages managed by package.el.")

(defvar my-info-dir (expand-file-name "info" my-init-dir)
  "Contains '.info' files to be merged with those provided by the system.")

(load (setq custom-file (expand-file-name "custom.el" my-config-dir)))

(mapc (lambda (dir) (add-to-list 'load-path dir))
      (list my-config-dir my-site-lisp-dir))

(require 'my-package)

(mapc (lambda (filename)
	(require (intern (file-name-sans-extension filename))))
      (directory-files my-config-dir nil "^my-.*\\.el$"))
