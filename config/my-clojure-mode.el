(my-require 'clojure-mode)
(my-require 'my-paredit)

(add-hook 'clojure-mode-hook 'paredit-mode)

(provide 'my-clojure-mode)
