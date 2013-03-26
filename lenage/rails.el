;;; Rails

(defalias 'rake 'rinari-rake)

;; ;; rhtml-mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/rhtml"))
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
  (lambda () (rinari-launch)))

(add-hook 'ruby-mode-hook
  (lambda () (rinari-launch)))

;; ;; ;; map .html.erb extension
(add-to-list 'auto-mode-alist '("\\.smartphone\\.erb$"  . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.mobile\\.erb$"  . rhtml-mode))
