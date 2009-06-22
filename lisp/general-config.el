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
;;(highlight-current-line-set-bg-color
;; (plist-get (custom-face-attributes-get 'fringe nil) :foreground))
(highlight-current-line-set-bg-color "#363943")

(highlight-current-line-minor-mode t)

;; ido
(require 'ido) 
(ido-mode t)

;; cursor-chg
(require 'cursor-chg)  ; Load the library
(toggle-cursor-type-when-idle 1) ; Turn on cursor change when Emacs is idle
(change-cursor-mode 1) ; Turn on change for overwrite, read-only, and input mode

;; quicksilver for emacs
(require 'anything)

;; show whitespaces and tabs
(require 'blank-mode)

;; highlight occurences of selected symbol
(load-library "light-symbol")



;; reStructuredText
(require 'rst)
(setq auto-mode-alist
      (append '(("\\.txt$" . rst-mode)
                ("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)) auto-mode-alist))

;; cg
(require 'cg-mode)
(add-to-list 'auto-mode-alist '("\\.cg\\'" . cg-mode))
(add-to-list 'auto-mode-alist '("\\.hlsl\\'" . cg-mode))

;; glsl
(autoload 'glsl-mode "glsl-mode" nil t)	
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))


;; set up unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; This from a japanese individual.  I hope it works.
(setq default-buffer-file-coding-system 'utf-8)
;; From Emacs wiki
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; MS Windows clipboard is UTF-16LE 
(set-clipboard-coding-system 'utf-16le-dos)


;; org-mode
(setq load-path (cons "~/.emacs.d/site-lisp/org-mode/lisp" load-path))
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)1
(define-key global-map "\C-ca" 'org-agenda)



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


(defun dos2unix()
  (interactive)
  (set-buffer-file-coding-system 'undecided-unix))

(defun unix2dos()
  (interactive)
  (set-buffer-file-coding-system 'undecided-dos))


(defalias 'qr 'query-replace)
(defalias 'qrr 'query-replace-regexp)





;;; First version; has bugs!
(defun count-words-region (beginning end)
  "Print number of words in the region.
Words are defined as at least one word-constituent
character followed by at least one character that
is not a word-constituent.  The buffer's syntax
table determines which characters these are."
  (interactive "r")
  (message "Counting words in region ... ")

;;; 1. Set up appropriate conditions.
  (save-excursion
    (goto-char beginning)
    (let ((count 0))

;;; 2. Run the while loop.
      (while (< (point) end)
        (re-search-forward "\\w+\\W*")
        (setq count (1+ count)))

;;; 3. Send a message to the user.
      (cond ((zerop count)
             (message
              "The region does NOT have any words."))
            ((= 1 count)
             (message
              "The region has 1 word."))
            (t
             (message
              "The region has %d words." count))))))




;; word count in buffer
(defun wc ()
  (interactive)
  (message "Word count: %s" (how-many "\\w+" (point-min) (point-max))))