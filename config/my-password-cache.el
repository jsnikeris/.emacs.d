(require 'password-cache)

(defconst my-password-cache-file "~/.secrets.el.gpg")

(defun my-password-cache-read ()
  (with-temp-buffer
   (insert-file-contents (expand-file-name my-password-cache-file))
   (read (current-buffer))))

(defun my-password-cache-load ()
  (let ((secrets (my-password-cache-read)))
    (when (hash-table-p secrets)
      (maphash (lambda (k v) (password-cache-add k v))
               secrets))))

(defadvice password-read-from-cache (before my-secrets-load (key))
  "Loads secrets from disk into password cache prior to reading."
  (unless (symbol-value (intern-soft key password-data))
    (my-password-cache-load)))

(ad-activate 'password-read-from-cache)

(provide 'my-password-cache)
