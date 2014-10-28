;;; Markdown

(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.text$" . markdown-mode))

(defun markdown-preview-file ()
  "run Marked on the current file and revert the buffer"
  (interactive)
  (shell-command
   (format "open -a /Users/lenage/Applications/Marked.app %s"
           (shell-quote-argument (buffer-file-name))))
  )

(add-hook 'markdown-mode-hook
          (lambda ()
            (orgtbl-mode t)
            (define-key markdown-mode-map (kbd "C-c C-v") 'markdown-preview-file)
            (flyspell-mode t)
            ))

;; disable flyspess for change-log-mode-hook and log-edit-mode-hook
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
      (add-hook hook (lambda () (flyspell-mode -1))))

(defun orgtbl-to-gfm (table params)
  "Convert the Orgtbl mode TABLE to GitHub Flavored Markdown."
  (let* ((alignment (mapconcat (lambda (x) (if x "|--:" "|---"))
                               org-table-last-alignment ""))
         (params2
          (list
           :splice t
	   :hline (concat alignment "|")
           :lstart "| " :lend " |" :sep " | ")))
    (orgtbl-to-generic table (org-combine-plists params2 params))))
