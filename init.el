(require 'cl)

(defvar emacs-root (if (eq system-type 'windows-nt)
		       (concat (getenv "APPDATA") "/")
		     (if (eq system-type 'gnu/linux)
			 (concat "/home/" user-login-name "/")))
  "My home directory — the root of my personal emacs load-path.")


(labels ((add-path (p)
		   (add-to-list 'load-path
				(concat emacs-root p))))
  (add-path ".emacs.d/lisp") ;; personnal elisp code
  (add-path ".emacs.d/site-lisp") ;; elisp from the interwub
  (add-path ".emacs.d/site-lisp/haskell-mode-2.4"))


;; system dependent configuration
(if (eq system-type 'windows-nt)
    (load-library "w32-setup")
  (if (eq system-type 'gnu/linux)
      (load-library "linux-setup")))

;; some global configuration
(load-library "visual-config")

;;  extentions & helper functions
(load-library "general-config")

;; progmodes
(load-library "ruby-config")
(load-library "lisp-config")
(load-library "cc-config")
(load-library "haskell-config")
(load-library "python-config")

;; other extentions & helper functions

(autoload 'typing-of-emacs "The Typing Of Emacs, a game." t)


;(put 'upcase-region 'disabled nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(frame-background-mode (quote dark))
 '(haskell-font-lock-symbols (quote unicode))
 '(highlight-current-line-globally t nil (highlight-current-line))
 '(inhibit-startup-screen t)
 '(rst-level-face-base-light 15))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
