(require 'ruby-mode)
(require 'ruby-electric)


(defun ruby-eval-buffer () (interactive)
  "Evaluate the buffer with ruby."
  (shell-command-on-region (point-min) (point-max) "ruby"))

(defun my-ruby-mode-hook ()
;;  (font-lock-mode t)
  (setq standard-indent 4)
  (ruby-electric-mode t))
;;  (define-key ruby-mode-map "\C-c\C-a" 'ruby-eval-buffer))

(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)

(setq auto-mode-alist (cons '("\\.rb\\'" . ruby-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))

