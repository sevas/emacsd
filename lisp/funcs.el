;; functions
;; reload .emacs on the fly
(defun reload-dot-emacs()
  (interactive)   
  (if(bufferp (get-file-buffer "init.el"))
      (save-buffer(get-buffer "init.el"))) 
  (load-file "~/.emacs.d/init.el")        
  (message ".emacs reloaded successfully"))

(defun toggle-abbrev-pabbrev()
  (interactive)
  (abbrev-mode)
  (pabbrev-mode)
  (message "abbrev mode toggled"))


(defun dos2unix()
  (interactive)
  (set-buffer-file-coding-system 'undecided-unix))

(defun unix2dos()
  (interactive)
  (set-buffer-file-coding-system 'undecided-dos))




;;; First version; has bugs!
;;(defun count-words-region (beginning end)
;;  "Print number of words in the region.
;;Words are defined as at least one word-constituent
;;character followed by at least one character that
;;is not a word-constituent.  The buffer's syntax
;;table determines which characters these are."
;;  (interactive "r")
;;  (message "Counting words in region ... ")

;;; 1. Set up appropriate conditions.
;;  (save-excursion
;;    (goto-char beginning)
;;    (let ((count 0))

;;; 2. Run the while loop.
;;      (while (< (point) end)
;;        (re-search-forward "\\w+\\W*")
;;        (setq count (1+ count)))

;;; 3. Send a message to the user.
;;      (cond ((zerop count)
;;             (message
;;              "The region does NOT have any words."))
;;            ((= 1 count)
;;             (message
;;              "The region has 1 word."))
;;            (t
;;             (message
;;              "The region has %d words." count))))))


;; word count in buffer
;;(defun wc ()
;;  (interactive)
;;  (message "Word count: %s" (how-many "\\w+" (point-min) (point-max))))




;; aliases
(defalias 'qr 'query-replace)
(defalias 'qrr 'query-replace-regexp)


(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))


(defun lorem ()
  "Insert a lorem ipsum."
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "
          "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim"
          "ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
          "aliquip ex ea commodo consequat. Duis aute irure dolor in "
          "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
          "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
          "culpa qui officia deserunt mollit anim id est laborum."))