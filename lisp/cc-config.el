(require 'cc-mode)

;;indent style
(setq c-default-style "bsd")

;;hungry delete
(c-toggle-hungry-state 1)

;; spaces indentation only
(defun my-build-tab-stop-list (width)
  (let ((num-tab-stops (/ 80 width))
	  (counter 1)
	  (ls nil))
          (while (<= counter num-tab-stops)
	          (setq ls (cons (* width counter) ls))
		        (setq counter (1+ counter)))
	      (set (make-local-variable 'tab-stop-list) (nreverse ls))))

(defun my-c-mode-common-hook ()
  (setq tab-width 4) 
  (my-build-tab-stop-list tab-width)
  (setq c-basic-offset tab-width)
  (setq indent-tabs-mode nil)) ;; force only spaces for indentation
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


;; C++ and C mode...
;; http://www.freebsd.org/doc/en/books/developers-handbook/emacs.html
(defun my-c++-mode-hook ()
  (setq tab-width 4)
  (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key c++-mode-map "\C-ce" 'c-comment-edit)
  (setq c++-auto-hungry-initial-state 'none)
  (setq c++-delete-function 'backward-delete-char)
  (setq c++-tab-always-indent t)
  (setq c-indent-level 4)
  (setq c-continued-statement-offset 4)
  (setq c++-empty-arglist-indent 4))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)


;; build command
(global-set-key [(f6)] 'compile)


;;compilation window
(setq compilation-window-height 10)
(setq compilation-finish-function
      (lambda (buf str)
	(if (string-match "exited abnormally" str)
	    ;;there were errors
	    (message "compilation errors, press C-x ` to visit")
	  
	  ;;no errors, make the compilation window go away in 0.5 seconds
	  (run-at-time 0.5 nil 'delete-windows-on buf)
	  (message "NO COMPILATION ERRORS!"))))


;;(load-library "cedet-config.el")

;; xrefactory
;; (setq exec-path (cons "~/.emacs.d/site-lisp/xref/" exec-path))
;; (setq load-path (cons "~/.emacs.d/site-lisp/xref/emacs" load-path))
;; (load "xrefactory.el")
