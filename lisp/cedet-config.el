;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CEDET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq semantic-load-turn-useful-things-on t)
(load-file "~/.emacs.d/site-lisp/cedet-1.0pre6/common/cedet.el")
;;make all the 'semantic.cache' files go somewhere sane
(setq semanticdb-default-save-directory "~/emacs-meta/semantic.cache/")
;; Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;; Select one of the following
(semantic-load-enable-code-helpers)
;;(semantic-load-enable-guady-code-helpers)
;;(semantic-load-enable-excessive-code-helpers)
;; Enable this if you develop in semantic, or develop grammars
;;(semantic-load-enable-semantic-debugging-helpers)

;; (define-key "M-S-/" "." 'semantic-complete-self-insert)

;; add commands 
(require 'semantic-ia)
(require 'semantic-gcc)

;; add some headers
(semantic-add-system-include "/opt/local/include/boost" 'c++-mode)



(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
(add-hook 'c-mode-common-hook 'my-cedet-hook)