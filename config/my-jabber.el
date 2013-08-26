(my-require 'jabber)
(my-require 'my-password-cache)         ;password in ~/.secrets.el.gpg

(setq
 jabber-account-list '(("snikeris@gmail.com"
                        (:port . 5223)
                        (:network-server . "173.194.68.125")
                        (:connection-type . ssl)))
 jabber-roster-line-format "%c %-25n %u %-8s"
 jabber-show-offline-contacts nil)

(provide 'my-jabber)
