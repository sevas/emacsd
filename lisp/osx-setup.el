(setenv "PATH"
        (concat "/Library/Frameworks/Python.framework/Versions/Current/bin:"
                (getenv "PATH")))
(setenv "PYTHONPATH"
        "/Library/Frameworks/Python.framework/Versions/Current/")

;; color theme
(require 'color-theme)
(color-theme-initialize)

;;(load-library "themes/color-theme-tango")
;;(color-theme-tango)

(load-library "themes/zen-and-art.el")
(color-theme-zen-and-art)

;;(if window-system
;;  (color-theme-tango)
;;(color-theme-tty-dark))

;;(if (not window-system)
;;    (color-theme-tty-dark))

(load-library "local-settings")


;; off with the mac keyboard madness
;;(setq mac-command-modifier 'alt)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)


