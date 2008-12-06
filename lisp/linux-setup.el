;; color theme
(require 'color-theme)
(color-theme-initialize)
;;(my-color-theme)
(load-library "themes/vibrant-ink-linux")
(color-theme-vibrant-ink-linux)

(load-library "local-settings")

;; icicles
;(setq load-path (cons "~/.emacs.d/site-lisp/icicles" load-path))
;(require 'icicles)
;(eval-after-load "icomplete" '(progn (require 'icomplete+)))
;(require 'icomplete)
;(require 'icomplete+)
