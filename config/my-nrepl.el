(my-require 'nrepl)

(defun my-nrepl-connected-hook ()
  (nrepl-interactive-eval
   "(do (set! *print-length* 103) (set! *print-level* 15))"))

(add-hook 'nrepl-connected-hook 'my-nrepl-connected-hook)

(provide 'my-nrepl)
