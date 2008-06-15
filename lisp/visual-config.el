;; --- general
;; UI
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; highlight selection
(transient-mark-mode t) 

;; color theme
(require 'color-theme)
(color-theme-initialize)
;(color-theme-dark-blue2)
;(color-theme-gnome2)
(load-library "themes/ryan-color-theme")
(color-theme-ryan)

;; parenthesis matching
(show-paren-mode 1)
(setq-default hilight-paren-expression t) 

;; syntax color
(global-font-lock-mode t)
;; colors > 9000
(setq font-lock-maximum-decoration t) 

;; compilation console
(setq compilation-window-height 10) 

;; select font
(set-face-font 'default "-outline-Consolas-normal-r-normal-normal-12-120-96-96-c-*-iso8859-1")

;; buffer switch with C-tab
(global-set-key [(control tab)] `other-window) 

;; clock
(display-time)
(setq display-time-24hr-format t) 

;; color/line numbers
(setq column-number-mode t)
(setq line-number-mode t) 

;; disable sound
;(setq visible-bell t)
(setq ring-bell-function (lambda () (message "*beep*")))
