;; color theme
(require 'color-theme)
(color-theme-initialize)

;;(load-library "themes/color-theme-vibrant-ink")
;;(color-theme-vibrant-ink-win)


;;(load-library "themes/color-theme-tango")
;;(color-theme-tango)
(load-library "themes/zen-and-art.el")
(color-theme-zen-and-art)

;; machine dependent shit (currently, only the font)
(load "local-settings" 'no-error)


;; icicles
;; (setq load-path (cons "~/.emacs.d/site-lisp/icicles" load-path))
;; (require 'icicles)
;; (eval-after-load "icomplete" '(progn (require 'icomplete+)))
;; (require 'icomplete)
;; (require 'icomplete+)


;;darkroom
;;(add-to-list 'load-path (concat emacs-root ".emacs.d/site-lisp/darkroom-mode"))
;;(require 'martin-darkroom)


;; eshell prompt
(setq eshell-prompt-function
      (lambda()
        (concat (getenv "USER") "@" (getenv "HOST") ":"
                ((lambda (p-lst)
                   (if (> (length p-lst) 3)
                       (concat
                        (mapconcat (lambda (elm) (substring elm 0 1))
                                   (butlast p-lst (- (length p-lst) 3))
                                   "/")
                        "/"
                        (mapconcat (lambda (elm) elm)
                                   (last p-lst (- (length p-lst) 3))
                                   "/"))
                     (mapconcat (lambda (elm) elm)
                                p-lst
                                "/")))
                 (split-string (eshell/pwd) "/"))
		"\n>>> "
                (if (= (user-uid) 0) "# " "$ "))))

;; (defun set-shell-cmdproxy()
;;   (interactive)
;;   (setq shell-file-name "cmdproxy")
;;   (setq explicit-shell-file-name "cmdproxy")
;;   (setenv "SHELL" explicit-shell-file-name)
;;   (setq w32-quote-process-args t)
;;   (setq shell-command-switch "/c")
;;   ) 


;; ;; cygwin
;; (require 'setup-cygwin)

;; (let* ((cygwin-root "c:/")
;;        (cygwin-bin (concat cygwin-root "/bin")))
;;   ;;(setenv "HOME" (concat cygwin-root "/home/Frederic"))
;;   ;;(setenv "PATH" (concat cygwin-bin ";" (getenv "PATH")))
;;  (setq exec-path (cons cygwin-bin exec-path)))

;; (setq shell-file-name "bash")
;; (setq explicit-shell-file-name "bash")

;; ;;(require 'cygwin-mount)
;; ;;(cygwin-mount-activate)



;; emacs-server fix for windows
;(and (= emacs-major-version 23)
;     (defun server-ensure-safe-dir (dir) "Noop" t))
     
;;(require 'server)
;;(when (and (= emacs-major-version 23) (equal window-system 'w32))
;;  (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
;;                                                 ; ~/.emacs.d/server is unsafe"
;;                                                 ; on windows.
;;(server-start)