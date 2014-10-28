;;; coffee mode
(custom-set-variables '(coffee-tab-width 2))

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
(add-hook 'scss-mode-hook 'rainbow-mode)
(add-hook 'sass-mode-hook 'rainbow-mode)


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
          (lambda() (setq tab-width 4)))

;; Haskell mode
(defun lenage-haskell-settings ()
  (haskell-indentation-mode 1)
  (haskell-indent-mode 1)
  (haskell-doc-mode 1)
  (interactive-haskell-mode 1))

(add-hook 'haskell-mode-hook 'lenage-haskell-settings)

;; clojure mode
(defun lenage-clojure-settings ()
  (interactive)
  (eldoc-mode)
  (setq-default clojure-enable-paredit t)
  (setq-default nrepl-hide-special-buffers t))


(add-hook 'cider-interaction-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'clojure-mode-hook 'lenage-clojure-settings)

;; Auto-start zencoding-mode on any markup modes
;; (add-hook 'sgml-mode-hook 'zencoding-mode)

;; Emacs lisp mode
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)

;; Python mode
(defun lenage-python-settings ()
  (elpy-mode 1)
  (elpy-clean-modeline 1)
  (setq-default python-indent-offset 4))
(add-hook 'python-mode-hook 'lenage-python-settings)

;; setup slime with quickliso slime-helper
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq-default inferior-lisp-program "sbcl --noinform --no-linedit")

;; smail-mode
(autoload 'smali-mode "smali-mode" "Major mode for editing and viewing smali issues" t)
(add-to-list 'auto-mode-alist '(".smali$" . smali-mode))
