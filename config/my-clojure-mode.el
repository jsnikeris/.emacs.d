(my-require 'clojure-mode)
(my-require 'my-paredit)
(my-require 'my-whitespace)

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(add-to-list 'whitespace-global-modes 'clojure-mode)

(provide 'my-clojure-mode)
