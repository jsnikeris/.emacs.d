(defvar my-init-dir (file-name-directory load-file-name)
  "The directory under which Emacs' initialization files reside.")

(defvar my-config-dir (expand-file-name "config" my-init-dir)
  "The directory under which configuration for various packages resides.")

(load (setq custom-file (expand-file-name "custom.el" my-config-dir)))

(add-to-list 'load-path my-config-dir)
(mapc (lambda (filename)
	(require (intern (file-name-sans-extension filename))))
      (directory-files my-config-dir nil "^my-.*\\.el$"))
