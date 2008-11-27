;; color theme
(require 'color-theme)
(color-theme-initialize)
;;(load-library "themes/my-color-theme")
;;(my-color-theme)
(load-library "themes/vibrant-ink-win")
(color-theme-vibrant-ink-win)

;;select font
(load-library "local-settings")
;;(set-face-font 'default "-outline-Consolas-normal-r-normal-normal-12-120-96-96-c-*-iso8859-1")
;;(set-default-font "Consolas-10")


;; icicles
(setq load-path (cons "~/.emacs.d/site-lisp/icicles" load-path))
(require 'icicles)
(eval-after-load "icomplete" '(progn (require 'icomplete+)))
(require 'icomplete)
(require 'icomplete+)


;; (defun set-shell-cmdproxy()
;;   (interactive)
;;   (setq shell-file-name "cmdproxy")
;;   (setq explicit-shell-file-name "cmdproxy")
;;   (setenv "SHELL" explicit-shell-file-name)
;;   (setq w32-quote-process-args t)
;;   (setq shell-command-switch "/c")
;;   ) 


;; cygwin
;;(require 'setup-cygwin)

;; (let* ((cygwin-root "c:/cygwin")
;;       (cygwin-bin (concat cygwin-root "/bin")))
;;  (setenv "HOME" (concat cygwin-root "/home/sevas"))
;;  (setenv "PATH" (concat cygwin-bin ";" (getenv "PATH")))
;;  (setq exec-path (cons cygwin-bin exec-path)))

;; (setq shell-file-name "bash")
;; (setq explicit-shell-file-name "bash")

;;(require 'cygwin-mount)
;;(cygwin-mount-activate)
