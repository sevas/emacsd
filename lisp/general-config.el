(setq inhibit-splash-screen t)

;; wtf ?
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)


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
(cua-mode t)


;; ido
(require 'ido) 
(ido-mode t)

;; cursor-chg
;;(require 'cursor-chg)  ; Load the library
;;(toggle-cursor-type-when-idle 1) ; Turn on cursor change when Emacs is idle
;;(change-cursor-mode 1) ; Turn on change for overwrite, read-only, and input mode

;; quicksilver for emacs
;;(require 'anything)

;; show whitespaces and tabs
;;(require 'blank-mode)


;; set up unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(set-language-environment 'utf-8)

;; This from a japanese individual.  I hope it works.
(setq default-buffer-file-coding-system 'utf-8)
;; From Emacs wiki
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; MS Windows clipboard is UTF-16LE 
(set-clipboard-coding-system 'utf-16le-dos)


;; org-mode
;;(setq load-path (cons "~/.emacs.d/site-lisp/org-mode/lisp" load-path))
;;(require 'org)
;;(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;;(define-key global-map "\C-cl" 'org-store-link)1
;;(define-key global-map "\C-ca" 'org-agenda)



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
;; (setq load-path (cons "~/.emacs.d/site-lisp/icicles" load-path))
;; (require 'icicles)
;; (eval-after-load "icomplete" '(progn (require 'icomplete+)))
;; (require 'icomplete)
;; (require 'icomplete+)


(require 'browse-kill-ring)

;; select whole buffer
;;(fset 'select-buffer
;;   [?\C-a ?\M-])
;;(global-set-key "^Ca" (quote select-buffer))


;;;; from http://emacs-fu.blogspot.com/2009/12/changing-cursor-color-and-shape.html
;;;; Change cursor color according to mode; inspired by
;;;; http://www.emacswiki.org/emacs/ChangingCursorDynamically
;;(setq djcb-read-only-color       "gray")
;;;; valid values are t, nil, box, hollow, bar, (bar . WIDTH), hbar,
;;;; (hbar. HEIGHT); see the docs for set-cursor-type
;; 
;;(setq djcb-read-only-cursor-type 'hbar)
;;(setq djcb-overwrite-color       "red")
;;(setq djcb-overwrite-cursor-type 'box)
;;(setq djcb-normal-color          "yellow")
;;(setq djcb-normal-cursor-type    'bar)
;; 
;;(defun djcb-set-cursor-according-to-mode ()
;;  "change cursor color and type according to some minor modes."
;;  (cond
;;   (buffer-read-only
;;    (set-cursor-color djcb-read-only-color)
;;    (setq cursor-type djcb-read-only-cursor-type))
;;   (overwrite-mode
;;    (set-cursor-color djcb-overwrite-color)
;;    (setq cursor-type djcb-overwrite-cursor-type))
;;   (t
;;    (set-cursor-color djcb-normal-color)
;;    (setq cursor-type djcb-normal-cursor-type))))
;;(add-hook 'post-command-hook 'djcb-set-cursor-according-to-mode)
