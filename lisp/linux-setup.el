;; color theme
(require 'color-theme)
(color-theme-initialize)
;;(my-color-theme)
;;(load-library "themes/vibrant-ink-linux")
;;(color-theme-vibrant-ink-linux)

(load-library "themes/zen-and-art")

(if window-system
    (color-theme-zen-and-art))
(if (not (window-system))
    (color-theme-tty-dark))



(load "local-settings" 'no-error)

