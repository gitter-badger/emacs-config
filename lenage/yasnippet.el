;; YASnippet
(require 'yas-jit)
(require 'dropdown-list)
(setq yas/prompt-functions '(
                             ;; shk-yas/helm-prompt
                             yas/ido-prompt
                             yas/dropdown-prompt
                             yas/completing-prompt))
(setq yas/root-directory '(
                           "~/.emacs.d/snippets"
                           "~/.emacs.d/elpa/yasnippet-20130218.2229/snippets"))

(setq yas/use-menu 'abbreviate)
(yas/jit-load)

;; (defun shk-yas/helm-prompt (prompt choices &optional display-fn)
;;   "Use helm to select a snippet. Put this into `yas/prompt-functions.'"
;;   (interactive)
;;   (setq display-fn (or display-fn 'identity))
;;   (if (require 'helm-config)
;;       (let (tmpsource cands result rmap)
;;         (setq cands (mapcar (lambda (x) (funcall display-fn x)) choices))
;;         (setq rmap (mapcar (lambda (x) (cons (funcall display-fn x) x)) choices))
;;         (setq tmpsource
;;               (list
;;                (cons 'name prompt)
;;                (cons 'candidates cands)
;;                '(action . (("Expand" . (lambda (selection) selection))))
;;                ))
;;         (setq result (helm-other-buffer '(tmpsource) "*helm-select-yasnippet"))
;;         (if (null result)
;;             (signal 'quit "user quit!")
;;           (cdr (assoc result rmap))))
;;     nil))
