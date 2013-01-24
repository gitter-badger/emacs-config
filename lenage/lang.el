;;; custome js2-mode .emacs.d/vendor/js2-mode
(vendor 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq js2-basic-offset 2)
(setq js2-bounce-indent-p t)
(setq js2-consistent-level-indent-inner-bracket-p t)
(setq js2-use-ast-for-indentation-p t)

;; lua mode
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

;; Auto-start zencoding-mode on any markup modes
;; (add-hook 'sgml-mode-hook 'zencoding-mode)

;; setup slime with quickliso slime-helper
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl --noinform --no-linedit")
