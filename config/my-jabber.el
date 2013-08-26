(my-require 'jabber)
(my-require 'my-password-cache)         ;password in ~/.secrets.el.gpg


(setq jabber-account-list
      '(("snikeris@gmail.com"
         (:port . 5223)
         (:network-server . "173.194.68.125")
         (:connection-type . ssl))))

(provide 'my-jabber)
