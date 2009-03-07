;;;; Fullscreen support for win32
;;;; Author: Martin Svenson
;;;; Last update: 2008-02-14
;;;; License: free for all usages/modifications/distributions/whatever.
;;;; Requirements: Windows XP (untested on Vista), EmacsW32
;;;;               + Some util to toggle windows titlebar
;;;;                 (w32toggletitle.py recommended)

;; ------ configuration -----
(defvar w32-fullscreen-python-cmd "C:/Python25/python.exe"
  "Path to python executable")
(defvar w32-fullscreen-toggletitle-cmd
   "c:/Python25/Scripts/w32toggletitle.py"
   "Path to w32toggletitle.py")

;; ------ code -----
(defvar w32-fullscreen-temp-caption "emacs-go-and-grab-me")

(defun w32-fullscreen-maximize-frame ()
  "Maximize the current frame (windows only)"
  (interactive)
  (w32-send-sys-command 61488))
 
(defun w32-fullscreen-restore-frame ()
  "Restore a minimized/maximized frame (windows only)"
  (interactive)
  (w32-send-sys-command 61728))

(defun w32-fullscreen-toggle-titlebar ()
  "Toggle display of the titlebar of frame (windows only)"
  (interactive)
  (let ((old-title (frame-parameter nil 'title)))
    (modify-frame-parameters (selected-frame)
			    `((title . ,w32-fullscreen-temp-caption)))
    (call-process w32-fullscreen-python-cmd
		  nil nil nil
		  w32-fullscreen-toggletitle-cmd w32-fullscreen-temp-caption)
    (sleep-for 0.2) ; time for script to work
    (modify-frame-parameters (selected-frame)
			    `((title . ,old-title)))))

(setq *w32-fullscreen-memtable* (make-hash-table))

(defun* w32-fullscreen-recall (var &optional (frame (selected-frame)))
  (cdr (assoc var (gethash frame *w32-fullscreen-memtable*))))

(defun* w32-fullscreen-remember (var val &optional (frame (selected-frame)))
  (let* ((varlist (gethash frame *w32-fullscreen-memtable*))
	 (target (assoc var varlist)))
    (cond (target
	   (setf (cdr target) val))
	  (t
	   (puthash frame (cons (cons var val)
				varlist) *w32-fullscreen-memtable*)))))

(defun w32-fullscreen()
  (interactive)
  "Toggle fullscreen display of current frame (windows only)"
  (cond ((w32-fullscreen-recall 'enabled)
	 (w32-fullscreen-remember 'enabled nil)
	 (w32-fullscreen-off))
	(t
	 (w32-fullscreen-remember 'enabled t)
	 (w32-fullscreen-on))))

(defun w32-fullscreen-on ()
  "Enable fullscreen display of current frame (windows only)"
  (interactive)
  ; - remember interface settings
  (w32-fullscreen-remember 'menu-bar-lines
			   (frame-parameter nil 'menu-bar-lines))
  (w32-fullscreen-remember 'tool-bar-lines
			   (frame-parameter nil 'tool-bar-lines))
  (w32-fullscreen-remember 'vertical-scroll-bars
	(frame-parameter nil 'vertical-scroll-bars))
  ; - set interface settings
  (modify-frame-parameters (selected-frame)
			   '((menu-bar-lines . 0) (tool-bar-lines . 0)
			     (vertical-scroll-bars . nil)))
  (w32-fullscreen-toggle-titlebar)
  (w32-fullscreen-maximize-frame))

(defun w32-fullscreen-off ()
  "Disable fullscreen display of current frame (windows only)"
  (interactive)
  ; - restore interface settings
  (modify-frame-parameters
   (selected-frame)
   `((menu-bar-lines . ,(w32-fullscreen-recall 'menu-bar-lines))
     (tool-bar-lines . ,(w32-fullscreen-recall 'tool-bar-lines))
     (vertical-scroll-bars . ,(w32-fullscreen-recall 'vertical-scroll-bars))))
  (w32-fullscreen-restore-frame)
  (w32-fullscreen-toggle-titlebar))

(provide 'martin-w32-fullscreen)