;; load progmodes w/ special configuration

(load-library "ruby-config")
(load-library "lisp-config")
(load-library "cc-config")
(load-library "haskell-config")
(load-library "python-config")


;; go-language support
(require 'go-mode-load)

;; cmake support
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))


;; latex files with latex-mode (instead of tex-mode)
(add-to-list 'auto-mode-alist '("\\.tex\\'" . latex-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . latex-mode))


;; bat mode
(setq auto-mode-alist 
	(append 
       (list (cons "\\.[bB][aA][tT]$" 'bat-mode))
       ;; For DOS init files
       ;;(list (cons "CONFIG\\."   'bat-mode))
       ;;(list (cons "AUTOEXEC\\." 'bat-mode))
       auto-mode-alist))

(autoload 'bat-mode "bat-mode"
  "DOS and WIndows BAT files" t)


;;graphviz
(load-library "graphviz-dot-mode") 



;; reStructuredText
(require 'rst)
(setq auto-mode-alist
      (append '(;;("\\.txt$" . rst-mode)
                ("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)) auto-mode-alist))

;; cg
(require 'cg-mode)
(add-to-list 'auto-mode-alist '("\\.cg\\'" . cg-mode))
(add-to-list 'auto-mode-alist '("\\.hlsl\\'" . cg-mode))

;; glsl
(autoload 'glsl-mode "glsl-mode" nil t)	
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))


;; file/mode associations

;; ogre dotscene
(add-to-list 'auto-mode-alist '("\\.scene\\'" . xml-mode ))
;; ogre-mygui layouts
(add-to-list 'auto-mode-alist '("\\.layout\\'" . xml-mode ))
;; Qt layouts
(add-to-list 'auto-mode-alist '("\\.ui\\'" . xml-mode ))
