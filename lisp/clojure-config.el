;;;; clojure
(require 'clojure-mode)
;;(autoload 'clojure-test-mode "clojure-test-mode" "Clojure test mode" t)
;;(autoload 'clojure-test-maybe-enable "clojure-test-mode" "" t)
;;(add-hook 'clojure-mode-hook 'clojure-test-maybe-enable)

(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

(add-to-list 'load-path (concat emacs-root ".emacs.d/site-lisp/swank-clojure-1.2"))
(require 'swank-clojure)
;;;;(swank-clojure-config
;;(setq swank-clojure-jar-path (expand-file-name "~/.swank-clojure/clojure.jar"))
;;(setq swank-clojure-jar-halp (expand-file-name "~/.swank-clojure/"))
;;(setq swank-clojure-extra-classpaths
    ;;  (list (expand-file-name "~/.clojure/clojure-contrib.jar")))


(setq swank-clojure-jar-path (expand-file-name "~/.swank-clojure/swank-clojure-1.1.0.jar")
      swank-clojure-jar-home (expand-file-name "~/.swank-clojure/")
      swank-clojure-classpath (list "~/.swank-clojure/*")) 

;;(eval-after-load "slime"
;;  '(progn (slime-setup '(slime-repl))))


(require 'assoc)
(aput 'slime-lisp-implementations 'clojure (list (swank-clojure-cmd) :init 'swank-clojure-init ))