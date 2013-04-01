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

;; (define-key rinari-minor-mode-map (kbd "C-c t") 'rinari-find-test)
;; (define-key rinari-minor-mode-map (kbd "C-c r") 'rinari-find-rspec)
;; (define-key rinari-minor-mode-map (kbd "C-c m") 'rinari-find-model)
;; (define-key rinari-minor-mode-map (kbd "C-c M") 'rinari-find-mailer)
;; (define-key rinari-minor-mode-map (kbd "C-c c") 'rinari-find-controller)
;; (define-key rinari-minor-mode-map (kbd "C-c v") 'rinari-find-view)
;; (define-key rinari-minor-mode-map (kbd "C-c Y") 'rinari-find-sass)
;; (define-key rinari-minor-mode-map (kbd "C-c f") 'rinari-find-file-in-project)
;; (define-key rinari-minor-mode-map (kbd "C-c h") 'rinari-find-helper)
;; (define-key rinari-minor-mode-map (kbd "C-c l") 'rinari-find-lib)
