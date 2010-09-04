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
  (c-toggle-auto-state)
  (setq indent-tabs-mode nil) ;; force only spaces for indentation
  (set-fill-column 80)
  
  (setq c-hanging-braces-alist '((namespace-open after)		;; Let namespace brace hang
                                 (defun-open after)		;; Let function brace hang
                                 (substatement-open after)	;; Let conditional block
															;; (if/for/etc) brace
															;; hang
                                 (brace-list-open after)	;; Let enum brace hang
                                 (class-open after)		;; Let struct brace hang
                                 ))

								 
	;; +  c-basic-offset times 1 
	;; -  c-basic-offset times -1 
	;; ++ c-basic-offset times 2 
	;; -- c-basic-offset times -2 
	;; *  c-basic-offset times 0.5 
	;; /  c-basic-offset times -0.5
  
  (setq c-offsets-alist '((innamespace . 0)		;; Don't indent for namespace
                          (defun-block-intro . +)	;; Do indent for functions
                          (statement-block-intro . 0)	;; Do indent for statement
														;; blocks
                          (statement . 0)		;; Don't indent on individual
												;; statements
                          (substatement-open . 0)	;; Don't indent for conditional
													;; blocks
                          (substatement . +)		;; Do indent for 1-line if blocks
                          (else-clause . 0)		;; Don't indent for the else clause
                          (block-close . 0)		;; Don't indent for the block
												;; closing }
                          (cpp-macro . [0])		;; Don't indent inside
												;; #ifdefs
                          (cpp-macro-cont . 0)		;; Don't indent inside
													;; #ifdefs
                          (inclass . +)			;; Do indent inside class
												;; declarations
                          (case-label . 0)		;; Don't indent for case
												;; labels
                          (statement-case-intro . +)	;; Do indent for case blocks
                          (comment-intro . 0)		;; Don't indent for comments
                          (c . 1)			;; Don't indent for comment
                                            ;; continuations
                          (brace-list-intro . +)	;; Do indent the first line
                                                    ;; in enums
                          (brace-list-entry . 0)	;; Do not indent additional
                                                    ;; lines inside enums
                          (brace-entry-open . 0)	;; Do not indent additional
                                                    ;; lines inside brace lists
                          (brace-list-close . 0)	;; Go back after brace list closes
                          (arglist-cont-nonempty . +)	;; Do indent additional
                                                        ;; argument lines
                          (arglist-close . 0)		;; Do not indent closing paren
                          ))
  (setq c-cleanup-list '(empty-defun-braces
			 scope-operator
			 defun-close-semi
			 ;;brace-catch-brace
			 ;;brace-else-brace
			 ;;brace-elseif-brace
			 ))

  )

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



;; Pulled from JanBorsodi.emacs
(defvar c++-header-ext-regexp "\\.\\(hpp\\|h\\|\hh\\|H\\)$")
(defvar c++-source-ext-regexp "\\.\\(cpp\\|c\\|\cc\\|C\\)$")
(defvar c++-default-header-ext "hpp")
(defvar c++-default-source-ext "cpp")
(defvar c++-source-extension-list '("c" "cc" "C" "cpp"))
(defvar c++-header-extension-list '("h" "hh" "H" "hpp"))
(defun toggle-source-header()
  "Switches to the source buffer if currently in the header buffer and vice versa."
  (interactive)
  (let ((buf (current-buffer))
	(name (file-name-nondirectory (buffer-file-name)))
	file
	offs)
    (setq offs (string-match c++-header-ext-regexp name))
    (if offs
	(let ((lst c++-source-extension-list)
	      (ok nil)
	      ext)
	  (setq file (substring name 0 offs))
	  (while (and lst (not ok))
	    (setq ext (car lst))
	    (if (file-exists-p (concat file "." ext))
		(setq ok t))
	    (setq lst (cdr lst)))
	  (if ok
	      (find-file (concat file "." ext))))
      (let ()
	(setq offs (string-match c++-source-ext-regexp name))
	(if offs
	    (let ((lst c++-header-extension-list)
		  (ok nil)
		  ext)
	      (setq file (substring name 0 offs))
	      (while (and lst (not ok))
		(setq ext (car lst))
		(if (file-exists-p (concat file "." ext))
		    (setq ok t))
		(setq lst (cdr lst)))
	      (if ok
		  (find-file (concat file "." ext)))))))))

(global-set-key [f9] 'toggle-source-header)	;; Toggle between the source and
						;; header file

