;;; $Id: pdbtrack.el,v 1.11 2000/08/28 18:34:52 klm Exp $

;;; Track source file lines as you run python/pdb in an emacs shell.

;;; To use this, put it in a dir on your emacs load-path, and in your
;;; .emacs:
;;;
;;;   (require 'pdbtrack)
;;;
;;; The tracking should only happen when you're getting pdb output,
;;; and not get in the way otherwise.  If for some reason, however
;;; you want to disable it in a buffer where it's active, eg to run
;;; pdb without the source files popping up, do:
;;;
;;;   Esc-x pdbtrack-toggle-stack-tracking
;;;
;;; from within that buffer.  Reissuing that command will reenable pdbtrack.

;;; klm 07/04/2000

(provide 'pdbtrack)

(defconst pdbtrack-stack_entry-regexp
  "> \\([^(]+\\)(\\([0-9]+\\))[?a-zA-Z0-9_]+()")
(defconst pdbtrack-input-prompt "\n[(<]?pdb[>)]? ")
(defconst pdbtrack-track-range 1000
  "Max number of characters from end of buffer to search for stack_entry.")

(make-variable-buffer-local 'pdbtrack-do-tracking)
(set-default 'pdbtrack-do-tracking t)
(require 'comint)
(add-hook 'comint-output-filter-functions 'pdbtrack-track-stack-file)
(set-default 'comint-output-filter-functions comint-output-filter-functions)

(if (not (string-match " XEmacs " emacs-version))
    ;; HACK ALERT.  See pdbtrack-get-default-filter-functions-hack comment.
    (add-hook 'comint-mode-hook 'pdbtrack-get-default-filter-functions-hack))
(defun pdbtrack-get-default-filter-functions-hack ()
  "XXX AAAK!  Compensation for emacs 20 (at least) make-local-hook breakage.

In emacs 20.5, at least, make-local-hook was ~improved~ - it butchered
local hook to leave `t' as a placemarker for running the contents of
the global hook.  However not all the standard callers were fixed to
recognize the `t' \(the note in the function says theyll get around to
it, sigh).  This routine stomps back.

When run on the mode's general hook, it reverses the substitution,
putting back the global hook var vals in place of the `t' placemarker.
Problem is, this'll have to be undone when the make-local-hook callers
are fixed."
  (if (member t comint-output-filter-functions)
      (let ((old comint-output-filter-functions)
            new first)
        (while old
          (setq first (car old)
                old (cdr old) new (append new (if (equal first t)
                                    (default-value
                                      'comint-output-filter-functions)
                                  (append new (list first)))))
          (setq comint-output-filter-functions new)))))

(defun pdbtrack-overlay-arrow (activation)
  "Activate or de arrow at beginning-of-line in current buffer."
  ;; This was derived/simplified from edebug-overlay-arrow
  (cond (activation
	 (setq overlay-arrow-position (make-marker))
	 (setq overlay-arrow-string "=>")
	 (set-marker overlay-arrow-position
		     (save-excursion (beginning-of-line) (point))
		     (current-buffer)))
	(overlay-arrow-position
	 (setq overlay-arrow-position nil))
	))

(defun pdbtrack-track-stack-file (text)
  "Show the file indicated by the pdb stack_entry line, in a separate window.

Activity is disabled if the buffer-local variable `pdbtrack-do-tracking' is
false.

We depend on the pdb input prompt matching `pdbtrack-input-prompt' at the
beginning of the line."
  ;; Instead of trying to piece things together from partial text
  ;; (which can be almost useless depending on emacs version), we
  ;; monitor to the point where we have the next pdb prompt, and then
  ;; check all text from comint-last-input-end to process-mark.  
  ;;
  ;; XXX It might be nice to provide an optional override, so this
  ;; routine could be fed debugger output strings as the text argument, for
  ;; deliberate application elsewhere.
  ;;
  ;; XXX We're very conservative about clearing the overlay arrow, to
  ;; minimize residue.  This means, for instance, that executing other 
  ;; pdb commands wipes out the highlight.
  (let* ((origbuf (current-buffer))
	 (currproc (get-buffer-process origbuf)))
    (if (not (and currproc pdbtrack-do-tracking))
        (pdbtrack-overlay-arrow nil)
      (let* ((origdir default-directory)
             (procmark (process-mark currproc))
             (block (buffer-substring (max comint-last-input-end
                                           (- procmark
                                              pdbtrack-track-range))
                                      procmark))
             fname lineno)
        (if (not (string-match (concat pdbtrack-input-prompt "$") block))
            (pdbtrack-overlay-arrow nil)
          (if (not (string-match
                    (concat ".*" pdbtrack-stack_entry-regexp ".*")
                    block))
              (pdbtrack-overlay-arrow nil)
            (setq fname (match-string 1 block)
                  lineno (match-string 2 block))
            (if (file-exists-p fname)
                (progn
                  (find-file-other-window fname)
                  (goto-line (string-to-int lineno))
                  (message "L%s %s" lineno fname)
                  (pdbtrack-overlay-arrow t)
                  (pop-to-buffer origbuf t) )
              (if (= (elt fname 0) ?\<)
                  (message "(Non-file source: '%s')" fname)
                (message "Not found: %s" fname))
              )))))))

;;; Enable/disable the pdbtrack-stack-tracker on the current buffer's 
;;; comint-output-filter-functions, if it's a buffer that has a process.
(defun pdbtrack-toggle-stack-tracking (&optional activate)
  (interactive "P")
  (if (not (get-buffer-process (current-buffer)))
      (error "No process associated with buffer '%s'" (current-buffer)))
  (setq pdbtrack-do-tracking (not pdbtrack-do-tracking))
  (message "%sabled pdbtrack-track-stack-file"
           (if pdbtrack-do-tracking "En" "Dis")))
(defun pdbtrack-activate-stack-tracking ()
  (interactive)
  (pdbtrack-toggle-stack-tracking t))
