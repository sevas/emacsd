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
(global-pabbrev-mode t)
    
;; mercurial
(setq load-path (cons "~/.emacs.d/ahg" load-path))
(require 'ahg)

;; snippets
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/site-lisp/snippets")

;; S-<arrows> to switch buffers
(windmove-default-keybindings)

;; column editing
(require 'cua-base)
(cua-mode)

;; highlight-current-line
(require 'highlight-current-line)
(highlight-current-line-set-bg-color "#202020")
(highlight-current-line-minor-mode t)

;; ido
(require 'ido)
(ido-mode t)

;; textmate 
(require 'textmate)
(textmate-mode)

;; icicles
;(setq load-path (cons "~/.emacs.d/site-lisp/icicles" load-path))
;(require 'icicles)
;(eval-after-load "icomplete" '(progn (require 'icomplete+)))
;(require 'icomplete)
;(require 'icomplete+)



;; xml-mode for ogre .scene file
(add-to-list 'auto-mode-alist '("\\.scene\\'" . xml-mode ))

;; functions
;; reload .emacs on the fly
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

