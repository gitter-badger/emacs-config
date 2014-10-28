;;; package --- Summary:
;;; Commentary:
;;; custome js2-mode .emacs.d/vendor/js2-mode
;;;
;;;
;;; Code:
(vendor 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq-default js2-basic-offset 2)
(setq-default js2-bounce-indent-p t)
(setq-default js2-consistent-level-indent-inner-bracket-p t)
(setq-default js2-use-ast-for-indentation-p t)
(setq-default js2-global-externs '("module" "require" "jQuery" "$" "_" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON" "debugger" "document" "window" "angular" "app" "Date"))

;; Let flycheck handle parse errors
(setq-default js2-show-parse-errors nil)
(setq-default js2-strict-missing-semi-warning nil)
(setq-default js2-missing-semi-one-line-override t)
(setq-default js2-strict-trailing-comma-warning t)
(setq-default js2-auto-indent-p t)
;; Use node as our repl
(setq-default inferior-js-program-command "node")

(setq-default inferior-js-mode-hook
      (lambda ()
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list 'comint-preoutput-filter-functions
                     (lambda (output)
                       (replace-regexp-in-string ".*1G\.\.\..*5G" "..."
                                                 (replace-regexp-in-string ".*1G.*3G" "> " output))))))

(eval-after-load 'js2-mode
  '(progn
     (define-key js2-mode-map (kbd "TAB") (lambda()
                                                 (interactive)
                                                 (let ((yas/fallback-behavior 'return-nil))
                                                   (unless (yas/expand)
                                                     (indent-for-tab-command)
                                                     (if (looking-back "^\s*")
                                                         (back-to-indentation))))))))

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-mode))
(add-hook 'js2-mode-hook 'ac-js2-mode)
;; setup skewer-setup to make live web development
(skewer-setup)
;; (provide 'js-mode)
;;; js-mode.el ends here
