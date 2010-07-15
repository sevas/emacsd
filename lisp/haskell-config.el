(load-from-site-lisp "haskell-mode-2.7.0")
(require 'haskell-mode)
(setq haskell-program-name "/usr/bin/ghci")


(setq auto-mode-alist
	  (append auto-mode-alist
		  '(("\\.[hg]s$"  . haskell-mode)
		("\\.hi$"	  . haskell-mode)
		("\\.l[hg]s$" . literate-haskell-mode))))
 
(autoload 'haskell-mode "haskell-mode"
  "Major mode for editing Haskell scripts." t)
(autoload 'literate-haskell-mode "haskell-mode"
  "Major mode for editing literate Haskell scripts." t)
 
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(add-hook 'haskell-mode-hook 'font-lock-mode)