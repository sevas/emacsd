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
(add-to-list 'auto-mode-alist '("\\.vs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.fs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.gs\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.pix\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vrt\\'" . glsl-mode))

;; file/mode associations

;; ogre dotscene
(add-to-list 'auto-mode-alist '("\\.scene\\'" . xml-mode ))
;; ogre-mygui layouts
(add-to-list 'auto-mode-alist '("\\.layout\\'" . xml-mode ))
;; Qt layouts
(add-to-list 'auto-mode-alist '("\\.ui\\'" . xml-mode ))



(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)


;; ogre material
(setq load-path (cons "~/.emacs.d/ogre-material-mode" load-path))
(require 'ogre-material-mode)

;; markdown-mode
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
   
(add-to-list 'auto-mode-alist '("\\.text" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown" . markdown-mode))


;;processing-mode
;;(add-to-list 'load-path "/path/to/processing-emacs/")
(autoload 'processing-mode "processing-mode" "Processing mode" t)
(add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))
(setq processing-location (concat (getenv "PROCESSING_HOME") "\\"))
