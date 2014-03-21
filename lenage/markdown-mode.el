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

(eval-after-load 'markdown-mode
  '(progn
     (define-key markdown-mode-map (kbd "C-c C-v") 'markdown-preview-file)
     ))
