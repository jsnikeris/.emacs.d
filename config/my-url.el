(my-require 'url)

(defun my-url-write-content (url filename)
  "Write the content of URL into file FILENAME."
  (save-excursion
    (set-buffer (url-retrieve-synchronously url))
    (delete-region (goto-char (point-min))
                   (+ 1 (re-search-forward "^$")))
    (write-file filename)
    (kill-buffer)))

(provide 'my-url)
