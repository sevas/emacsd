;; color theme
(require 'color-theme)
(color-theme-initialize)

(load-library "themes/color-theme-tango")

(if window-system
  (color-theme-tango)
(color-theme-tty-dark))

;;(if (not window-system)
;;    (color-theme-tty-dark))

(load-library "local-settings")

