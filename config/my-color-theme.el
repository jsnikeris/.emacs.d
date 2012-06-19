(require 'my-package)
(require 'theme-changer)

(my-package-install-package 'color-theme)
(my-package-install-package 'color-theme-solarized)

(require 'color-theme-solarized)

;; set calendar-location-name, calendar-latitude, and calendar-longitude
;; in site-start.el (e.g. /etc/emacs/site-start.el)
(when calendar-latitude
  (change-theme 'color-theme-solarized-light 'color-theme-solarized-dark))

(provide 'my-color-theme)
