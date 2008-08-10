;; default 
;; (setq find-file-default emacs-root)

;; autocomplete (, {, [
(require 'pair-mode)
(pair-mode)

;; better i-search highlight
(require 'ishl)

;; pabbrev
(require 'pabbrev)
(pabbrev-mode t)

;; mercurial
(setq load-path (cons "~/.emacs.d/ahg" load-path))
(require 'ahg)

;; snippets
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/site-lisp/snippets")


;; functions
;Reload .emacs on the fly                                                                                                    
(defun reload-dot-emacs()                                                                                                    
  (interactive)                                                                                                              
  (if(bufferp (get-file-buffer "init.el"))                                                                                    
      (save-buffer(get-buffer "init.el")))                                                                                    
  (load-file "~/.emacs.d/init.el")                                                                                                     
  (message ".emacs reloaded successfully"))

