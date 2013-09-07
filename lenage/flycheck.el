;;; Flycheck

(defface flymake-errline '((t (:background "#330000" :overline "red" :underline "red"))) nil)
(defface flymake-warnline '((t (:background "#333300" :overline "yellow" :underline "yellow"))) nil)

;; enable Flycheck mode in all buffers, in which it can be used
(add-hook 'after-init-hook #'global-flycheck-mode)
;; (set-face-background 'flymake-errline "red4")
;; (set-face-background 'flymake-warnline "dark slate blue")
