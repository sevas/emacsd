;; UI
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))


(setq inhibit-startup-screen t)
;; highlight selection
(transient-mark-mode t) 

;; parenthesis matching
(show-paren-mode 1)
(setq-default hilight-paren-expression t) 


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(display-time-mode t)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(size-indication-mode t)
 ;;'(truncate-lines t)
 )


;; syntax color
(global-font-lock-mode t)
;; colors > 9000
(setq font-lock-maximum-decoration t) 

;; compilation console
(setq compilation-window-height 10) 

;; buffer switch with C-tab
(global-set-key [(control tab)] `other-window) 

;; clock
(display-time)
(setq display-time-24hr-format t) 

;; color/line numbers
(setq column-number-mode t
      line-number-mode t)

;; disable sound
;; (setq visible-bell t)
(setq ring-bell-function (lambda () (message "*beep*")))

;; (setq ring-bell-function 
;;       (lambda ()
;; 	(unless (memq this-command
;; 		      '(isearch-abort abort-recursive-edit exit-minibuffer keyboard-quit))
;; 	  (ding))))


;; window title
(setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b"))

(setq frame-background-mode 'dark)


;; highlight-current-line
(require 'highlight-current-line)
;;(highlight-current-line-set-bg-color
;; (plist-get (custom-face-attributes-get 'fringe nil) :foreground))
;;(highlight-current-line-set-bg-color "#363943")
;;(highlight-current-line-minor-mode)
(highlight-current-line-on t)


;; highlight occurences of selected symbol
(load-library "light-symbol")
(light-symbol-mode)


;; autocomplete (, {, [
(require 'pair-mode)
(pair-mode t)

;; better i-search highlight
(require 'ishl)


;; No 'yes or no' question, only 'y or n'
(fset 'yes-or-no-p 'y-or-n-p)


;; window management
(winner-mode 1)