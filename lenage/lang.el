(vendor 'coffee-mode)
;;; coffee mode
(defun coffee-custom ()
  "coffee-mode-hook"
  ;; Emacs key binding
  (define-key coffee-mode-map (kbd "C-c c-r") 'coffee-compile-buffer))

(add-hook 'coffee-mode-hook '(lambda () (coffee-custom)))

;;; lua mode
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))

;; yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; CSS mode
(defun all-css-modes() (css-mode) (rainbow-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . all-css-modes))


;; markdown-mode
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.text$" . markdown-mode))

(eval-after-load 'markdown-mode
  '(progn
     (define-key markdown-mode-map (kbd "C-c C-v") 'markdown-preview)
     ))


;; go mode
(add-hook 'go-mode-hook
          (lambda()
            (setq tab-width 4)))

;; Haskell mode
(add-hook 'haskell-mode-hook
          (lambda()
            (setq tab-width 4)))

;; clojure mode
(add-hook 'clojure-mode-hook
          (lambda ()
            (setq clojure-enable-paredit t)
            (setq nrepl-hide-special-buffers t)
            ))

;; (setq nrepl-hide-special-buffers t)

;; Auto-start zencoding-mode on any markup modes
;; (add-hook 'sgml-mode-hook 'zencoding-mode)

;; setup slime with quickliso slime-helper
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl --noinform --no-linedit")
