(my-require 'clojure-mode)
(my-require 'my-paredit)

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(provide 'my-clojure-mode)
