;; use python-mode.el instead of the defualt python.el
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript" . python-mode))



;;;; iypthon
(require 'ipython)
(setq python-python-command "ipython")
(setq py-python-command-args '( "-colors" "Linux" "-cl"))

(add-hook 'python-mode-hook
          (lambda ()
            ;; deactivate guessed settings for indentation
            (set-variable 'py-smart-indentation nil)
            ;; tab = 4 spaces
            (set-variable 'py-indent-offset 4) 
            ;; never use tabs to indent
            (set-variable 'indent-tabs-mode nil)
            ;; indent when starting a new line
            (define-key py-mode-map (kbd "RET") 'newline-and-indent)
            ;; tab key to expand yasnippet
            (define-key py-mode-map [tab] 'yas/expand)
            ;; self explanatory
            (setq yas/after-exit-snippet-hook 'indent-according-to-mode)
            ))



(defun setup-ropemacs ()
  "Setup the ropemacs harness"
  (setenv "PYTHONPATH"
          (concat
           (getenv "PYTHONPATH") ":"
           (concat epy-install-dir "rope-dist")))

  ;; TODO: We need something like add-to-list?
  (setq pymacs-load-path
        (list
         (concat emacs-root  ".emacs.d/python-libs/")))

  (pymacs-load "ropemacs" "rope-")
  
  ;; Stops from erroring if there's a syntax err
  (setq ropemacs-codeassist-maxfixes 3)
  (setq ropemacs-guess-project t)
  (setq ropemacs-enable-autoimport t)

  ;; Adding hook to automatically open a rope project if there is one
  ;; in the current or in the upper level directory
  (add-hook 'python-mode-hook
            (lambda ()
              (cond ((file-exists-p ".ropeproject")
                     (rope-open-project default-directory))
                    ((file-exists-p "../.ropeproject")
                     (rope-open-project (concat default-directory "..")))
                    ))))




;; TODO : fix pymacs/ropemacs. This thing is a shame.
; (load-from-site-lisp "Pymacs-0.24-beta1")
; ;; Initialize Pymacs
; (autoload 'pymacs-apply "pymacs")
; (autoload 'pymacs-call "pymacs")
; (autoload 'pymacs-eval "pymacs" nil t)
; (autoload 'pymacs-exec "pymacs" nil t)
; (autoload 'pymacs-load "pymacs" nil t)
; ;; Initialize Rope  
; (setq ropemacs-enable-autoimport t)
; (setq ropemacs-autoimport-modules '("os", "sys", "math"))
; (pymacs-load "ropemacs" "rope-")


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;           
; ; Auto-completion 
; ;  Integrates:    
; ;   1) Rope       
; ;   2) Yasnippet  
; ;   all with AutoComplete.el 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
; (defun prefix-list-elements (list prefix)
;  (let (value)
;    (nreverse
;     (dolist (element list value)
;      (setq value (cons (format "%s%s" prefix element) value))))))
; 
; (defvar ac-source-rope
;  '((candidates
;     . (lambda ()
;         (prefix-list-elements (rope-completions) ac-target))))
;  "Source for Rope")
; 
; (defun ac-python-find ()
;  "Python `ac-find-function'."
;  (require 'thingatpt)
;  (let ((symbol (car-safe (bounds-of-thing-at-point 'symbol))))
;    (if (null symbol)
;        (if (string= "." (buffer-substring (- (point) 1) (point)))
;            (point)
;          nil)
;      symbol)))
; 
; (defun ac-python-candidate ()
;   "Python `ac-candidates-function'"
;   (let (candidates)
;     (dolist (source ac-sources)
;       (if (symbolp source)
;           (setq source (symbol-value source)))
;       (let* ((ac-limit (or (cdr-safe (assq 'limit source)) ac-limit))
;              (requires (cdr-safe (assq 'requires source)))
;              cand)
;         (if (or (null requires)
;                 (>= (length ac-target) requires))
;             (setq cand
;                   (delq nil
;                         (mapcar (lambda (candidate)
;                                   (propertize candidate 'source source))
;                                 (funcall (cdr (assq 'candidates source)))))))
;         (if (and (> ac-limit 1)
;                  (> (length cand) ac-limit))
;             (setcdr (nthcdr (1- ac-limit) cand) nil))
;         (setq candidates (append candidates cand))))
;     (delete-dups candidates)))
; 
; (add-hook 'python-mode-hook
;          (lambda ()
;            (auto-complete-mode 1)
;            (set (make-local-variable 'ac-sources)
;                 (append ac-sources '(ac-source-rope) '(ac-source-yasnippet)))
;            (set (make-local-variable 'ac-find-function) 'ac-python-find)
;            (set (make-local-variable 'ac-candidate-function) 'ac-python-candidate)
;            (set (make-local-variable 'ac-auto-start) nil)))
; 
; 
; (add-hook 'python-mode-hook
;          (lambda ()
;            (auto-complete-mode 1)
;            (setq (make-local-variable 'ac-sources)
;                  (append ac-sources '(ac-source-yasnippet) '(ac-source-ropemacs)))
;            (set (make-local-variable 'ac-find-function) 'ac-python-find)
;            (set (make-local-variable 'ac-candidate-function) 'ac-python-candidate)
;            (set (make-local-variable 'ac-auto-start) nil)))
;            
; ;;Ryan's python specific tab completion
; (defun ryan-python-tab ()
;  ; Try the following:
;  ; 1) Do a yasnippet expansion
;  ; 2) Do a Rope code completion
;  ; 3) Do an indent
;  (interactive)
;  (if (eql (ac-start) 0)
;      (indent-for-tab-command)))
; (defadvice ac-start (before advice-turn-on-auto-start activate)
;  (set (make-local-variable 'ac-auto-start) t))
; (defadvice ac-cleanup (after advice-turn-off-auto-start activate)
;  (set (make-local-variable 'ac-auto-start) nil))
; 
; (define-key py-mode-map "\t" 'ryan-python-tab)

 
;; 
;; 
;;;; growable miniconsole for python backtraces
;;(setq resize-mini-windows t
;;      max-mini-window-height .85)

;; gud and pdb integration
(require 'gud)
(setq gud-pdb-command-name "~/bin/pdb.py")

(defadvice pdb (before gud-query-cmdline activate)
  "Provide a better default command line when called interactively."
  (interactive
   (list (gud-query-cmdline pdb-path
			    (file-name-nondirectory buffer-file-name)))))


;; pdb
;;(setq pdb-path 'pdb.bat'
;;      gud-pdb-command-name (symbol-name pdb-path))

;;(defvar gud-pdb-marker-regexp "^>
;;\\([-a-zA-Z0-9_/.:\\]*\\|<string>\\)(\\([0-9]+\\))\\([a-zA-Z0-9_]*\\|\\?\\)()\\(->[^\n]*\\)?\n")


;; virtualenv
;;(add-hook 'python-mode-hook '(lambda () (require 'virtualenv)))


;; Pyflakes : static checking for python files. Mapped to F5.
(defun pyflakes-thisfile () 
    (interactive
        (compile (format "pyflakes %s" (buffer-file-name)))))

(define-minor-mode pyflakes-mode
  "Toggle pyflakes mode.
   With no argument, this command toggles the mode.
   Non-null prefix argument turns on the mode.
   Null prefix argument turns off the mode."
   ;; The initial value.
   nil
   ;; The indicator for the mode line.
  " Pyflakes"
  ;; The minor mode bindings.
  '(([f5] . pyflakes-thisfile)))

(add-hook 'python-mode-hook (lambda () (pyflakes-mode t)))


;; Cython mode
(require 'cython-mode)
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))