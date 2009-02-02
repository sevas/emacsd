(defun color-theme-vibrant-ink-linux ()
  "Modified from Vivid Chalk, a vim port of Vibrant Ink."
  (interactive)
  (color-theme-install
   '(color-theme-vibrant-ink-linux
     ((background-color . "#000000")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "white")
      (foreground-color . "#DDDDDB")
      (list-matching-lines-face . bold)
      (view-highlight-face . highlight))
     (default ((t (nil))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:italic t :bold t))))
     (fringe ((t (:background "222244"))))
     (font-lock-builtin-face ((t (:foreground "#CCCC33"))))
     (font-lock-comment-face ((t (:italic t :foreground "#9933cc"))))
     (font-lock-comment-delimiter-face ((t (:foreground "#9933cc"))))
     (font-lock-constant-face ((t (:foreground "#339999"))))
     (font-lock-function-name-face ((t (:foreground "#ffcc00"))))
     (font-lock-keyword-face ((t (:foreground "#ff6600"))))
     (font-lock-preprocessor-face ((t (:foreground "#aaffff"))))
     (font-lock-reference-face ((t (:foreground "LightSteelBlue"))))
     (font-lock-string-face ((t (:foreground "#59c82b"))))
     (font-lock-doc-face ((t (:foreground "LightSalmon"))))
     (font-lock-type-face ((t (:italic t :foreground "#aaaaaa"))))
     (font-lock-variable-name-face ((t (:foreground "#aaccff"))))
     (font-lock-warning-face ((t (:bold t :foreground "Pink"))))
     (paren-face-match-light ((t (:background "#222222"))))
     (highlight ((t (:background "darkolivegreen"))))
     (italic ((t (:italic t))))
     (modeline ((t (:background "#a5baf1" :foreground "black"))))
     (modeline-buffer-id ((t (:background "#a5baf1" :foreground "black"))))
     (modeline-mousable ((t (:background "#a5baf1" :foreground "black"))))
     (modeline-mousable-minor-mode ((t (:background "#a5baf1" :foreground "black"))))
     (region ((t (:background "#222244"))))
     (primary-selection ((t (:background "#333355"))))
     (isearch ((t (:background "#555555"))))
     (zmacs-region ((t (:background "#555577"))))
     (secondary-selection ((t (:background "darkslateblue"))))
     (flymake-errline ((t (:background "LightSalmon" :foreground "black"))))
     (flymake-warnline ((t (:background "LightSteelBlue" :foreground "black"))))
     (underline ((t (:underline t))))
     (minibuffer-prompt ((t (:bold t :foreground "#ff6600"))))
     (eshell-prompt ((t (:foreground "#9933cc"))))
     (twit-message-face ((default (:family "sans"  :height 1.0))))
     (twit-info-face ((t (:foreground "SlateBlue" :height 0.8))))
     (twit-title-face ((t  (:background "Cyan4"))))
     (twit-zebra-1-face ((t (:background "#101015"))))
     (twit-zebra-2-face ((t (:background "#131320"))))
     (ido-only-match ((((class color))
		       (:foreground "LimeGreen"))
		      (t (:italic t))))
     (ido-subdir ((((min-colors 88) (class color))
		   (:foreground "royal blue"))
		  (((class color))
		   (:foreground "dodger blue"))
		  (t (:underline t))))
     (ido-first-match ((((class color))
			(:foreground "LimeGreen"))
		       (t (:bold t))))
     ))) 