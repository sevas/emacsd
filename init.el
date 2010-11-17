(require 'cl)

(defvar emacs-root (if (eq system-type 'windows-nt)
		       (concat (getenv "HOME") "\\")
		     (if (eq system-type 'gnu/linux)
			 (concat "/home/" user-login-name "/")
			(if (eq system-type 'darwin)
			     (concat "/Users/" user-login-name "/"))))
  "My home directory the root of my personal emacs load-path.")


(labels ((add-path (p)
		   (add-to-list 'load-path
				(concat emacs-root p))))

  (add-path ".emacs.d/lisp") ;; personnal elisp code
  (add-path ".emacs.d/site-lisp") ;; elisp from the interwub
  )




;; system dependent configuration
(if (eq system-type 'windows-nt)
    (load-library "w32-setup")
  (if (eq system-type 'gnu/linux)
      (load-library "linux-setup")
     (if (eq system-type 'darwin)
       (load-library "osx-setup"))))

(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; load helper functions
(load-library "funcs")

;; some global configuration
(load-library "visual-config")

;;  extensions
(load-library "general-config")



;; load progmodes & file associations
(load-library "progmodes")


;; other extentions & helper functions
;;(autoload 'typing-of-emacs "The Typing Of Emacs, a game." t)


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(frame-background-mode (quote dark))
 '(haskell-font-lock-symbols (quote unicode)))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(display-time-mode t)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(size-indication-mode t))
