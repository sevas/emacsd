(require 'funcs)
(setq inhibit-splash-screen t)

;; wtf ?
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; tab = 4 spaces 
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)


;; mercurial
;;(setq load-path (cons "~/.emacs.d/ahg" load-path))
(load-from-site-lisp "ahg")
(require 'ahg)


;; snippets
(load-from-site-lisp "yasnippet-0.7.0")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/site-lisp/yasnippet-0.7.0/snippets")
(require 'dropdown-list)
(setq yas/prompt-functions '(yas/ido-prompt yas/dropdown-prompt))



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

(require 'browse-kill-ring)

;; select whole buffer
;;(fset 'select-buffer
;;   [?\C-a ?\M-])
;;(global-set-key "^Ca" (quote select-buffer))

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
(ac-common-setup)
(ac-config-default)
 

;; ibuffer by default
(global-set-key (kbd "C-x C-b") 'ibuffer)

(blink-cursor-mode)