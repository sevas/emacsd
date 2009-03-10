;; color theme
(require 'color-theme)
(color-theme-initialize)
;;(my-color-theme)
;;(load-library "themes/vibrant-ink-linux")
;;(color-theme-vibrant-ink-linux)

(load-library "themes/color-theme-tango")

(if window-system
    (color-theme-tango))
(if (not (window-system))
    (color-theme-tty-dark))


(load-library "local-settings")

