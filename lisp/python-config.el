;; --- python
(require 'python-mode)

;; pymacs
(require 'pymacs)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;; ;;(eval-after-load "pymacs"
;; ;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))
;;(pymacs-load "ropemacs" "rope-")
;;(setq ropemacs-enable-autoimport t)

;; ;; python failed tab completion
;; (require 'pycomplete)
;; (require 'ryan-pycomplete)

;; ;; ipython 
;; (setq ipython-command "C:/Python25/Scripts/ipython.py")
 (require 'ipython)

;; growable miniconsole for python backtraces
(setq resize-mini-windows t
      max-mini-window-height .85)
