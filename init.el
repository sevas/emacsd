(require 'cl)


(defvar emacs-root (if (eq system-type 'windows-nt)
		       (concat "c:/Documents and Settings/" user-login-name "/Application Data/")
		     (if (eq system-type 'gnu/linux)
			 (concat "/home/" user-login-name "/")))
  "My home directory — the root of my personal emacs load-path.")


(labels ((add-path (p)
		   (add-to-list 'load-path
				(concat emacs-root p))))
  (add-path ".emacs.d/lisp") ;; personnal elisp code
  (add-path ".emacs.d/site-lisp") ;; elisp from the interwub
  )


;; system dependent configuration
(if (eq system-type 'windows-nt)
    (load-library 'w32-setup)
  (if (eq system-type 'gnu/linux)
      (load-library 'linux-setup)))

;; some global configuration
(load-library "visual-config")
(load-library "general-config")
(load-library "python-config")
(load-library "lisp-config")




;;--------------------
;(require 'w3m-load)
;(require 'ipython)
;(require 'lorem-ipsum)
;(require 'erc)
;(require 'column-marker)
;(require 'dired-single)
;(require 'pair-mode)
;(require 'snippet)
;(require 'linum)
;(require 'weblogger)
;(require 'pager)
;(require 'snippet)
;Use the newer yasnippet
;(require 'yasnippet)
;(yas/initialize)
;(yas/load-directory "~/.emacs.d/yasnippet-0.2.2/snippets")
;(load-library "csharp-mode")
;(load-library "ryan-functions")
;(load-library "keyboard-shortcuts")
;(load-library "mmm-mako")
;(load-library "align")
;(load-library "g")

;(load-library "ryan-python")
;(load-library "ryan-shell")
;(load-library "ryan-subversion")



;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(inhibit-startup-screen t))
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  )

;; (put 'erase-buffer 'disabled nil)
;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(inhibit-startup-screen t))
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  )

;(put 'upcase-region 'disabled nil)