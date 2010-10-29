(setenv "PATH"
        (concat "/Library/Frameworks/Python.framework/Versions/Current/bin:"
                (getenv "PATH")))

(setenv "PYTHONPATH"
        (concat 
         "/Library/Frameworks/Python.framework/Versions/Current/"
         (concat emacs-root "/.emacs.d/python-libs")))



;; color theme
(require 'color-theme)
(color-theme-initialize)

(load-library "themes/zen-and-art.el")
(color-theme-zen-and-art)


;; load some fonts
(load-library "local-settings")


;; off with the mac keyboard madness
;;(setq mac-command-modifier 'alt)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)

