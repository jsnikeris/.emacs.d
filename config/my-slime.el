(defvar my-slime-port 4005)

(defun my-slime-load ()
  (interactive)
  (load (expand-file-name "~/.quicklisp/slime-helper.el"))
  (setq inferior-lisp-program "sbcl")
  (require 'slime))

(make-network-process
 :name "swank-ping" :host 'local :service my-slime-port :nowait t
 :sentinel (lambda (proc status)
             (delete-process proc)
             (when (string-match "open" status)
               (my-slime-load)
               (slime-connect 'local my-slime-port))))

(provide 'my-slime)
