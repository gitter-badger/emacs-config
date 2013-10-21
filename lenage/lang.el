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
(add-hook 'cider-interaction-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'clojure-mode-hook
          (lambda ()
            (eldoc-mode t)
            (paredit-mode t)
            (setq-default clojure-enable-paredit t)
            (setq-default nrepl-hide-special-buffers t)
            ))

;; Auto-start zencoding-mode on any markup modes
;; (add-hook 'sgml-mode-hook 'zencoding-mode)


;; Python mode
(add-hook 'python-mode
          (lambda ()
            (elpy-enable)
            (elpy-clean-modeline)
            (setq-default python-indent-offset 4)
            ))

;; setup slime with quickliso slime-helper
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq-default inferior-lisp-program "sbcl --noinform --no-linedit")

;; smail-mode
(autoload 'smali-mode "smali-mode" "Major mode for editing and viewing smali issues" t)
(add-to-list 'auto-mode-alist '(".smali$" . smali-mode))
