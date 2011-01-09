(setenv "PATH"
        (concat "/Library/Frameworks/Python.framework/Versions/2.6/bin:"
                (getenv "PATH")))

(setenv "PYTHONPATH"
        (concat 
         "/Library/Frameworks/Python.framework/Versions/2.6/"
         (concat emacs-root "/.emacs.d/python-libs")))


;; haskell binaries (hlint et co)
(setenv "PATH"
        (concat (concat (getenv "HOME") "/.cabal/bin/:")
                (getenv "PATH")))


;; color theme
(require 'color-theme)
(color-theme-initialize)

(load-library "themes/zen-and-art.el")
(color-theme-zen-and-art)


;; load some fonts
(load "local-settings" 'no-error)


;; off with the mac keyboard madness
;;(setq mac-command-modifier 'alt)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)

;; using macpython for hg 
(custom-set-variables
  '(ahg-hg-command "/usr/local/bin/hg"))