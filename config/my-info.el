(my-require 'info)

(defun my-info-install (info-file)
  "Adds an entry for INFO-FILE in the 'dir' file under `my-info-dir'."
  (call-process "install-info" nil nil nil
                info-file
                (expand-file-name "dir" my-info-dir)))

(mapc 'my-info-install (directory-files my-info-dir t "\\.info$"))
 
(info-initialize)
(add-to-list 'Info-directory-list my-info-dir)

(provide 'my-info)
