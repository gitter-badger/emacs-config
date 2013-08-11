;; Function to create new functions that look for a specific pattern
(defun ffip-create-pattern-file-finder (&rest patterns)
  (lexical-let ((patterns patterns))
    (lambda ()
      (interactive)
      (let ((ffip-patterns patterns))
        (find-file-in-project)))))


;; Find file in project, with specific patterns
;; (global-set-key (kbd "C-x fjs")
;;                 (ffip-create-pattern-file-finder "*.js"))
;; (global-set-key (kbd "C-x fcs")
;;                 (ffip-create-pattern-file-finder "*.css"))
