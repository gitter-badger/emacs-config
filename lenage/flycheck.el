;;; Flycheck

;; enable Flycheck mode in all buffers, in which it can be used
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Disable warnning while edit emacs lisp scripts
(eval-after-load 'flycheck '(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))
