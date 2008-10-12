(require 'python-mode)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode ))
;;(add-to-list 'auto-mode-alist '("SConstruct'" . python-mode ))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(add-hook 'python-mode-hook
	  'pabbrev-mode)

;; pymacs
(require 'pymacs)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;; ;;(eval-after-load "pymacs"
;; ;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)
(ropemacs-mode)

;; ;; python failed tab completion
;; (require 'pycomplete)
;; (require 'ryan-pycomplete)

;; ipython 
(setq ipython-command "/usr/bin/ipython")
;;(custom-set-variables '(frame-background-mode 'dark))
(setq frame-background-mode 'dark)
(require 'ipython)


;; growable miniconsole for python backtraces
(setq resize-mini-windows t
      max-mini-window-height .85)


;; pdb
(setq pdb-path '/usr/lib/python2.5/pdb.py
      gud-pdb-command-name (symbol-name pdb-path))

(defadvice pdb (before gud-query-cmdline activate)
  "Provide a better default command line when called interactively."
  (interactive
   (list
    (gud-query-cmdline pdb-path
		       (file-name-nondirectory buffer-file-name))))) 

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