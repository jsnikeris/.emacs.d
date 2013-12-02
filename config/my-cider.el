(my-require 'cider)

(defun my-cider-connected-hook ()
  (nrepl-interactive-eval
   "(do (set! *print-length* 103) (set! *print-level* 15))"))

(add-hook 'cider-connected-hook 'my-cider-connected-hook)
(add-hook 'cider-mode-hook 'paredit-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(provide 'my-cider)
