
;; python completion

(load-from-site-lisp "Pymacs-0.24-beta1")
;;(require 'python)
;;(require 'auto-complete)
;;(require 'yasnippet)

;;(require 'smart-operator)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
 
(require 'python-mode)
(add-hook 'python-mode-hook
          (lambda ()
            (set-variable 'py-indent-offset 4)
            ;(set-variable 'py-smart-indent nil)
            ;(set-variable 'indent-tabs-mode nil)
            (define-key py-mode-map (kbd "RET") 'newline-and-indent)
            ;(define-key py-mode-map [tab] 'yas/expand)
            ;(setq yas/after-exit-snippet-hook 'indent-according-to-mode)
            ;;(smart-operator-mode-on)
            ))

;;;; Initialize Pymacs
;;(autoload 'pymacs-apply "pymacs")
;;(autoload 'pymacs-call "pymacs")
;;(autoload 'pymacs-eval "pymacs" nil t)
;;(autoload 'pymacs-exec "pymacs" nil t)
;;(autoload 'pymacs-load "pymacs" nil t)
;;;; Initialize Rope  
;;(pymacs-load "ropemacs" "rope-")
;;(setq ropemacs-enable-autoimport t)

(add-hook 'python-mode-hook
          (lambda ()
            ;;(auto-complete-mode 1)
            (ac-common-setup)
            (ac-ropemacs-initialize)
            ;;(setq ac-auto-start 1) 
            (setq ropemacs-enable-autoimport t)
            ))




(require 'ipython)
(setq python-python-command "ipython")
(setq py-python-command-args '( "-colors" "Linux" "-cl"))
;;(setq py-python-command-args '(""))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;           
;;; Auto-completion 
;;;  Integrates:    
;;;   1) Rope       
;;;   2) Yasnippet  
;;;   all with AutoComplete.el 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;(defun prefix-list-elements (list prefix)
;;  (let (value)
;;    (nreverse
;;     (dolist (element list value)
;;      (setq value (cons (format "%s%s" prefix element) value))))))
;; 
;;(defvar ac-source-rope
;;  '((candidates
;;     . (lambda ()
;;         (prefix-list-elements (rope-completions) ac-target))))
;;  "Source for Rope")
;; 
;;(defun ac-python-find ()
;;  "Python `ac-find-function'."
;;  (require 'thingatpt)
;;  (let ((symbol (car-safe (bounds-of-thing-at-point 'symbol))))
;;    (if (null symbol)
;;        (if (string= "." (buffer-substring (- (point) 1) (point)))
;;            (point)
;;          nil)
;;      symbol)))

;; (defun ac-python-candidate ()
;;   "Python `ac-candidates-function'"
;;   (let (candidates)
;;     (dolist (source ac-sources)
;;       (if (symbolp source)
;;           (setq source (symbol-value source)))
;;       (let* ((ac-limit (or (cdr-safe (assq 'limit source)) ac-limit))
;;              (requires (cdr-safe (assq 'requires source)))
;;              cand)
;;         (if (or (null requires)
;;                 (>= (length ac-target) requires))
;;             (setq cand
;;                   (delq nil
;;                         (mapcar (lambda (candidate)
;;                                   (propertize candidate 'source source))
;;                                 (funcall (cdr (assq 'candidates source)))))))
;;         (if (and (> ac-limit 1)
;;                  (> (length cand) ac-limit))
;;             (setcdr (nthcdr (1- ac-limit) cand) nil))
;;         (setq candidates (append candidates cand))))
;;     (delete-dups candidates)))

;;(add-hook 'python-mode-hook
;;          (lambda ()
;;            (auto-complete-mode 1)
;;            (set (make-local-variable 'ac-sources)
;;                 (append ac-sources '(ac-source-rope) '(ac-source-yasnippet)))
;;            (set (make-local-variable 'ac-find-function) 'ac-python-find)
;;            (set (make-local-variable 'ac-candidate-function) 'ac-python-candidate)
;;            (set (make-local-variable 'ac-auto-start) nil)))
;;

;;(add-hook 'python-mode-hook
;;          (lambda ()
;;            (auto-complete-mode 1)
;;            (setq (make-local-variable 'ac-sources)
;;                  (append ac-sources '(ac-source-yasnippet) '(ac-source-ropemacs)))
;;            (set (make-local-variable 'ac-find-function) 'ac-python-find)
;;            (set (make-local-variable 'ac-candidate-function) 'ac-python-candidate)
;;            (set (make-local-variable 'ac-auto-start) nil)))
;;            
                  

;;;;Ryan's python specific tab completion(defun ryan-python-tab ()
;;(defun ryan-python-tab ()
;;  ; Try the following:
;;  ; 1) Do a yasnippet expansion
;;  ; 2) Do a Rope code completion
;;  ; 3) Do an indent
;;  (interactive)
;;  (if (eql (ac-start) 0)
;;      (indent-for-tab-command)))
;; 
;;(defadvice ac-start (before advice-turn-on-auto-start activate)
;;  (set (make-local-variable 'ac-auto-start) t))
;;(defadvice ac-cleanup (after advice-turn-off-auto-start activate)
;;  (set (make-local-variable 'ac-auto-start) nil))
;; 
;;(define-key python-mode-map "\t" 'ryan-python-tab)
 
 
;;(setq auto-mode-alist
;;      (cons '("SConstruct" . python-mode) auto-mode-alist))
;;(setq auto-mode-alist
;;      (cons '("SConscript" . python-mode) auto-mode-alist))
;; 
;; 
;;;; growable miniconsole for python backtraces
;;(setq resize-mini-windows t
;;      max-mini-window-height .85)



;;(add-hook 'python-mode-hook
;;          (lambda ()
;;            (font-lock-add-keywords nil
;;                                    '(("\\<\\(TODO\\):" 1 font-lock-warning-face prepend)
;;                                      ("\\<\\(and\\|or\\|not\\)\\>" .
;;                                       font-lock-keyword-face)))))


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


(require 'gud)
(setq gud-pdb-command-name "~/pdb")

;; pdb
;;(setq pdb-path 'pdb.bat'
;;      gud-pdb-command-name (symbol-name pdb-path))




;;(defvar gud-pdb-marker-regexp "^>
;;\\([-a-zA-Z0-9_/.:\\]*\\|<string>\\)(\\([0-9]+\\))\\([a-zA-Z0-9_]*\\|\\?\\)()\\(->[^\n]*\\)?\n")



;;(add-hook 'python-mode-hook '(lambda () (require 'virtualenv)))


(defun pyflakes-thisfile () (interactive)
       (compile (format "pyflakes %s" (buffer-file-name)))
)

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
    '( ([f5] . pyflakes-thisfile) )
)

(add-hook 'python-mode-hook (lambda () (pyflakes-mode t)))
(require 'cython-mode)
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))