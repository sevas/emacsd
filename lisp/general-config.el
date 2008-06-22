;; default 
;; (setq find-file-default emacs-root)

;; better i-search highlight
(require 'ishl)

;; mercurial
(setq load-path (cons "~/.emacs.d/ahg" load-path))
(require 'ahg)

;; snippets
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/site-lisp/snippets")

;; icicles
(setq load-path (cons "~/.emacs.d/site-lisp/icicles" load-path))
(require 'icicles)
;;(eval-after-load "icomplete" '(progn (require 'icomplete+)))
;;(require 'icomplete)
;;(require 'icomplete+)


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

