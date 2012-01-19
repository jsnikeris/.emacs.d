(defvar my-init-dir (file-name-directory load-file-name)
  "The directory under which Emacs' initialization files reside.")

(defvar my-config-dir (concat my-init-dir "config/")
  "The directory under which configuration for various packages resides.")

(load (setq custom-file (concat my-config-dir "custom.el")))

(add-to-list 'load-path my-config-dir)
(mapc (lambda (filename)
	(require (intern (file-name-sans-extension filename))))
      (directory-files my-config-dir nil "^my-.*\\.el$"))
