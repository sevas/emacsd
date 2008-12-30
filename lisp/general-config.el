;; default 
;; (setq find-file-default emacs-root)

;; autocomplete (, {, [
(require 'pair-mode)
(pair-mode t)

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
(highlight-current-line-set-bg-color "#101020")
(highlight-current-line-minor-mode t)

;; ido
(require 'ido)
(ido-mode t)

;; textmate 
(require 'textmate)
(textmate-mode)

;; cursor-chg
(require 'cursor-chg)  ; Load the library
(toggle-cursor-type-when-idle 1) ; Turn on cursor change when Emacs is idle
(change-cursor-mode 1) ; Turn on change for overwrite, read-only, and input mode

;; quicksilver for emacs
(require 'anything)

;; show whitespaces and tabs
(require 'blank-mode)

;; Change cursor color according to mode
;; (defvar hcz-set-cursor-color-color "")
;; (defvar hcz-set-cursor-color-buffer "")
;; (defun hcz-set-cursor-color-according-to-mode ()
;;   "change cursor color according to some minor modes."
;;   ;; set-cursor-color is somewhat costly, so we only call it when needed:
;;   (let ((color
;; 	 (if buffer-read-only "white"
;; 	   (if overwrite-mode "red"
;; 	     "yellow"))))
;;     (unless (and
;; 	     (string= color hcz-set-cursor-color-color)
;; 	     (string= (buffer-name) hcz-set-cursor-color-buffer))
;;       (set-cursor-color (setq hcz-set-cursor-color-color color))
;;       (setq hcz-set-cursor-color-buffer (buffer-name)))))
;; (add-hook 'post-command-hook 'hcz-set-cursor-color-according-to-mode)

;; icicles
;(setq load-path (cons "~/.emacs.d/site-lisp/icicles" load-path))
;(require 'icicles)
;(eval-after-load "icomplete" '(progn (require 'icomplete+)))
;(require 'icomplete)
;(require 'icomplete+)



;; file/mode associations
(add-to-list 'auto-mode-alist '("\\.scene\\'" . xml-mode ))
(add-to-list 'auto-mode-alist '("\\.layout\\'" . xml-mode ))
(add-to-list 'auto-mode-alist '("\\.ui\\'" . xml-mode ))

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

