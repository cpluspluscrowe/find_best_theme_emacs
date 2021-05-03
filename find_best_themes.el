
(setq themes (custom-available-themes))

(defun try-themes (theme) 
  "function to try each theme"
  (let ((theme-name (symbol-name theme))) 
    (progn (disable-theme (car custom-enabled-themes)) 
           (load-theme theme t) 
           (message "%s" theme) 
           (if (y-or-n-p (symbol-name theme)) 
               (progn theme-name (print theme-name)) nil ; return theme name if I like it
               ))))

(setq good-theme-names (-map #'try-themes themes))

; Themes I like
;"doom-monokai-classic"
;"doom-old-hope"
;"doom-outrun-electric"
;"deeper-blue"
;"misterioso"
;"tango-dark"
;"tsdh-dark"
