;; default 
;; (setq find-file-default emacs-root)

;; autocomplete (, {, [
(require 'pair-mode)
(pair-mode)

;; better i-search highlight
(require 'ishl)

;; pabbrev
(require 'pabbrev)
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

(windmove-default-keybindings)

;; twitter mode
(require  'twit)
(twit-mode)

;; column editing
(require 'cua-base)
(cua-mode)

;; line numbering
(require 'setnu)
(add-hook 'text-mode-hook 'turn-on-setnu-mode)


;; functions
;Reload .emacs on the fly                                                                                                    
(defun reload-dot-emacs()
  (interactive)   
  (if(bufferp (get-file-buffer "init.el"))
      (save-buffer(get-buffer "init.el"))) 
  (load-file "~/.emacs.d/init.el")        
  (message ".emacs reloaded successfully"))
