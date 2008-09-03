;; default 
;; (setq find-file-default emacs-root)

;; autocomplete (, {, [
(require 'pair-mode)
(pair-mode)

;; better i-search highlight
(require 'ishl)

;; pabbrev
(abbrev-mode (not t))
(require 'pabbrev)
;(add-hook 'after-change-major-mode-hook
;	  'pabbrev-mode)
(global-pabbrev-mode t)

;(pabbrev-mode t)

;; (defun my-abbrev-hook()
;;   (abbrev-mode)
;;   (pabbrev-mode t))
;; (add-hook 'abbrev-mode 'my-abbrev-hook)
  
  

;; mercurial
(setq load-path (cons "~/.emacs.d/ahg" load-path))
(require 'ahg)

;; snippets
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/site-lisp/snippets")



;; twitter mode
(require  'twit)
(twit-mode)

;; column editing
(require 'cua-base)
(cua-mode)

;; functions
;Reload .emacs on the fly
(defun reload-dot-emacs()
  (interactive)   
  (if(bufferp (get-file-buffer "init.el"))
      (save-buffer(get-buffer "init.el"))) 
  (load-file "~/.emacs.d/init.el")        
  (message ".emacs reloaded successfully"))

(defun toggle-abbrev-pabbrev()
  (interactive)
  (abbrev-mode)
  (pabbrev-mode)
  (message "abbrev mode toggled"))