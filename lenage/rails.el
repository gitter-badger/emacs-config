;;; Rails

(defalias 'rake 'rinari-rake)

;; ;; rhtml-mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/rhtml"))
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
  (lambda () (rinari-launch)))

;; ;; ;; map .html.erb extension
(add-to-list 'auto-mode-alist '("\\.smartphone\\.erb$"  . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.mobile\\.erb$"  . rhtml-mode))

;; ;; Rinari rhtml-mode color overrides
;; (set-face-background 'erb-face "gray9")
;; (set-face-background 'erb-delim-face "gray9")
;; (set-face-background 'erb-out-delim-face "gray9")

;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/emacs-rails-reloaded"))
;; (require 'rails-autoload)

;; (define-key rinari-minor-mode-map (kbd "C-c t") 'rinari-find-test)
;; (define-key rinari-minor-mode-map (kbd "C-c r") 'rinari-find-rspec)
;; (define-key rinari-minor-mode-map (kbd "C-c m") 'rinari-find-model)
;; (define-key rinari-minor-mode-map (kbd "C-c c") 'rinari-find-controller)
;; (define-key rinari-minor-mode-map (kbd "C-c v") 'rinari-find-view)
