(my-require 'nxml-mode)

(defun my-pretty-print-xml-buffer ()
  "Pretty format XML markup in buffer. The function inserts
linebreaks to separate tags that have nothing but whitespace
between them.  It then indents the markup by using nxml's
indentation rules."
  (interactive)
  (save-excursion
      (nxml-mode)
      (goto-char (point-min))
      (while (search-forward-regexp "&lt;" nil t)
        (replace-match "<"))
      (goto-char (point-min))
      (while (search-forward-regexp "&gt;" nil t)
        (replace-match ">"))
      (goto-char (point-min))
      (while (search-forward-regexp "\>[ \\t]*\<" nil t)
        (backward-char) (insert "\n"))
      (indent-region (point-min) (point-max))))

(provide 'my-nxml)
