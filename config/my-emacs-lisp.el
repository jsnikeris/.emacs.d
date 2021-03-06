(my-require 'lisp-mode)
(my-require 'my-rainbow-delimiters)
(my-require 'my-whitespace)

(defun my-find-thing-at-point ()
  (interactive)
  (if (not (equal (variable-at-point) 0))
      (find-variable-at-point)
    (find-function-at-point)))

(define-key emacs-lisp-mode-map (kbd "M-.") 'my-find-thing-at-point)

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

(add-to-list 'whitespace-global-modes 'emacs-lisp-mode)

(provide 'my-emacs-lisp)
