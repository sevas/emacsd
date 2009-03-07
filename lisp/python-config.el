(require 'python-mode)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode ))
;;(add-to-list 'auto-mode-alist '("SConstruct'" . python-mode ))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;;(add-hook 'python-mode-hook
;;	  'pabbrev-mode)


;; TODO : fix rope/ropemacs & shit
;; ;; pymacs
;(require 'pymacs)
;;(autoload 'pymacs-apply "pymacs")
;;(autoload 'pymacs-call "pymacs")
;;(autoload 'pymacs-eval "pymacs" nil t)
;;(autoload 'pymacs-exec "pymacs" nil t)
;;(autoload 'pymacs-load "pymacs" nil t)
;(eval-after-load "pymacs"
;  '(add-to-list 'pymacs-load-path ""))
;(pymacs-load "ropemacs" "rope-")
;(setq ropemacs-enable-autoimport t)
;; (ropemacs-mode)

;; lazy ropemacs loading
(defun load-ropemacs ()
  "Load pymacs and ropemacs"
  (interactive)
  (require 'pymacs)
  (pymacs-load "ropemacs" "rope-")
  ;; Automatically save project python buffers before refactorings
  (setq ropemacs-confirm-saving 'nil)
  )
(global-set-key "\C-xpl" 'load-ropemacs)


;; ;; python failed tab completion
;; (require 'pycomplete)

;; ipython 
;; (setq ipython-command "ipython")
;; (require 'ipython)

;; growable miniconsole for python backtraces
(setq resize-mini-windows t
      max-mini-window-height .85)


;;(add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (font-lock-add-keywords nil
;; 				    '(("\\<\\(TODO\\):" 1 font-lock-warning-face prepend)
;; 				      ("\\<\\(and\\|or\\|not\\)\\>" .
;; 				       font-lock-keyword-face)))))



;;(add-hook 'python-mode
;; (lambda ()
;;   (font-lock-add-keywords nil
;;    '(( "\\<\\(FIXME\\):" 1 font-lock-keyword-face prepend)))))

  ;; ( "\\(<\\)\\(TRUE\\|FALSE\\|NULL\\|void\\)\\(/>\\)"
  ;; 	 (1 font-lock-tag-face)
  ;; 	 (2 font-lock-constant-face)
  ;; 	 (3 font-lock-tag-face))
  ;; ( "\\(@\\)\\(author\\|see\\|param\\|throws\\|returns?\\|version\\)"
  ;; 	 (1 font-lock-tag-face)
  ;; 	 (2 font-lock-constant-face))
  ;; ))



;; pdb
;;(setq pdb-path 'pdb.bat'
;;      gud-pdb-command-name (symbol-name pdb-path))


;;(defvar gud-pdb-marker-regexp "^>
;;\\([-a-zA-Z0-9_/.:\\]*\\|<string>\\)(\\([0-9]+\\))\\([a-zA-Z0-9_]*\\|\\?\\)()\\(->[^\n]*\\)?\n")



;; ;;flymake + pylint
;; (when (load "flymake" t)
;;   (defun flymake-pylint-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;; 		       'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "~/bin/epylint.py" (list local-file))))
  
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pylint-init)))
