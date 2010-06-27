(require 'funcs)
(setq inhibit-splash-screen t)

;; wtf ?
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; tab = 4 spaces 
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; pabbrev
;;(abbrev-mode (not t))
;;(require 'pabbrev)
;;(global-pabbrev-mode t)
    
;; mercurial
(setq load-path (cons "~/.emacs.d/ahg" load-path))
(require 'ahg)

;; snippets
(load-from-site-lisp "yasnippet-0.5.9")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/site-lisp/yasnippet-0.5.9/snippets")



;; S-<arrows> to switch buffers
(windmove-default-keybindings)

;; column editing
(require 'cua-base)
(cua-mode t)


;; ido
(when (> emacs-major-version 21)
  (require 'ido)
  (ido-mode t)
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-use-filename-at-point 'guess
        ido-max-prospects 10))


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


;; desktop mode
;; load saved desktop on startup and save buffers to desktop on exit
(load "desktop")
(desktop-save-mode 1)
(desktop-read)
(setq desktop-load-locked-desktop t)

;; save a bunch of variables to the desktop file
;; for lists specify the len of the maximal saved data also
(setq desktop-globals-to-save
      (append '((extended-command-history . 30)
                (file-name-history        . 100)
                (grep-history             . 30)
                (compile-history          . 30)
                (minibuffer-history       . 50)
                (query-replace-history    . 60)
                (read-expression-history  . 60)
                (regexp-history           . 60)
                (regexp-search-ring       . 20)
                (search-ring              . 20)
                (shell-command-history    . 50)
                tags-file-name
                register-alist)))

;; save our place when closing a file
(require 'saveplace)
(setq-default save-place t)

;; always revert buffers if their files change on disk to reflect new changes
(global-auto-revert-mode 1)


;; Save a list of recent files visited.
(recentf-mode 1)

;; 80 col, no alternative
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Don't clutter up directories with files~
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat emacs-root "backups")))))


;;slime
(load-from-site-lisp "slime-frozen")
(load-from-site-lisp "slime-frozen/contrib")
(require 'slime)


(load-from-site-lisp "auto-complete-1.3")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dicts")
(ac-config-default)
 
