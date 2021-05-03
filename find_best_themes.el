
(defun try-theme (theme) 
  "function to try each theme"
  (if (eq (type-of theme) 'string) 
      (try-themes (intern-soft theme)) 
    (progn (let ((theme-name (symbol-name theme))) 
             (disable-theme (car custom-enabled-themes)) 
             (load-theme theme t) 
             (message "%s" theme) 
             (if (y-or-n-p (symbol-name theme)) 
                 (progn theme-name (print theme-name)) nil ; return theme name if I like it
                 )))))

(defun find-best-theme (themes) 
  (progn
                                        ; remove all existing themes
    (while (disable-theme (car custom-enabled-themes))) 
    (cond ((eq (length themes) 1) 
           (car themes)) 
          (t (find-best-theme (remove nil (-map #'try-theme themes)))))))

                                        ; work through themes recursively until one is left
(setq best-theme (find-best-theme (custom-available-themes)))
(try-theme best-theme)

                                        ; now repeat until the length is one.
                                        ; "misterioso"
