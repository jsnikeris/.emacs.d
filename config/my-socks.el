(when (equal system-name "debitude.cable.comcast.com")
  (setq socks-override-functions 1)
  (setq socks-noproxy '("localhost"))
  (setq socks-server '("tikul" "tikul.chalybs.net" 18333 5))
  (require 'socks))

(provide 'my-socks)
