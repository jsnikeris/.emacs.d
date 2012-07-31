(my-require 'lisp-mode)

(defun my-find-thing-at-point ()
  (interactive)
  (if (not (equal (variable-at-point) 0))
      (find-variable-at-point)
    (find-function-at-point)))

(define-key emacs-lisp-mode-map (kbd "M-.") 'my-find-thing-at-point)

(provide 'my-emacs-lisp)
