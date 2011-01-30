(defun color-theme-zen-and-art ()
  "Irfn's zen with a bit of art."
  (interactive)
  (color-theme-install
   '(color-theme-zen-and-art
     ((background-color . "#141414")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "#C6B032")
      (foreground-color . "#DDFFD1")
      (list-matching-lines-face . bold)
      (view-highlight-face . highlight))
     (default ((t (nil))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:italic t :bold t))))
     (fringe ((t (:background "#252323"))))
     (highlight-current-line-face ((t (:background "#252323"))))
     (font-lock-builtin-face ((t (:foreground "#86453A"))))
     (font-lock-comment-face ((t (:italic t :foreground "#4C565D"))))
     (font-lock-comment-delimiter-face ((t (:foreground "#4C565D"))))
     (font-lock-constant-face ((t (:foreground "#86453A"))))
     (font-lock-function-name-face ((t (:foreground "#C6B032"))))
     (font-lock-keyword-face ((t (:foreground "#AE5825"))))
     (font-lock-preprocessor-face ((t (:foreground "#007575"))))
     (font-lock-reference-face ((t (:foreground "#0055FF"))))
     (font-lock-string-face ((t (:foreground "#5A7644"))))
     (font-lock-doc-face ((t (:foreground "#DDFFD1"))))
     (font-lock-type-face ((t (:italic t :foreground "#C6B032"))))
     (font-lock-variable-name-face ((t (:foreground "#46657B"))))
     (font-lock-warning-face ((t (:bold t :foreground "Pink"))))
     ;;(paren-face-match-light ((t (:background "#252323"))))
     (highlight ((t (:background "darkolivegreen"))))
     (italic ((t (:italic t))))
     (modeline ((t (:background "#3F3B3B" :foreground "white"))))
     (modeline-inactive ((t (:background "#3F3B3B" :foreground "grey10"))))
     (modeline-buffer-id ((t (:background "#3F3B3B" :foreground
                                          "white"))))
     (modeline-mousable ((t (:background "#a5baf1" :foreground
                                         "black"))))
     (modeline-mousable-minor-mode ((t (:background
                                        "#a5baf1" :foreground "black"))))
     (region ((t (:background "#3B3B3F"))))
     (primary-selection ((t (:background "#3B3B3F"))))
     (isearch ((t (:background "#555555"))))
     (zmacs-region ((t (:background "#555577"))))
     (secondary-selection ((t (:background "#545459"))))
     (flymake-errline ((t (:background "LightSalmon" :foreground
                                       "black"))))
     (flymake-warnline ((t (:background "LightSteelBlue" :foreground
                                        "black"))))
     (underline ((t (:underline t))))
     (minibuffer-prompt ((t (:bold t :foreground "#ff6600"))))
     (hi-blue ((t (:background "#555555" ))))
     (show-paren-match ((t (:bold t :background "#DDFFD1"  :foreground "#141414"))))
     (show-paren-mismatch ((t (:bold t :background "#86453A" :foreground "white"))))
     ;; erc
     (erc-default-face ((t (nil))))
     (erc-bold-face ((t (:bold t :weight bold))))
     (erc-error-face ((t (:bold t :foreground "#AE5825"))))
     (erc-input-face ((t (:foreground "#729fcf"))))
     (erc-direct-msg-face ((t (:foreground "#C6B032" :bold t))))
     (erc-highlight-face ((t (:foreground "#2e3436" :background "#e9b96e"))))
     (erc-notice-face ((t (:foreground "#ad7fa8" :italic t))))
     (erc-prompt-face ((t (:bold t :foreground "#D2DEC4" :background "#46657B"))))
     (erc-timestamp-face ((t (:bold t :foreground "#46657B"))))
     ;; compilation window
     (compilation-error ((t (:foreground "#86453A")))) 
     (compilation-info ((t (:foreground "#007575"))))
     (compilation-line-number  ((t (:foreground "#46657B"))))            
     (compilation-warning ((t (:foreground "#86453A"))))     
     )))