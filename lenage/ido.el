;;; Interactive do, find-file and iswitchb replacement with fuzzy/flex matching.

(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
(setq ido-enable-last-directory-history nil) ; forget latest selected directory names
(setq ido-enable-prefix nil)

(defun recentf-ido-find-file ()
  "Find a recent file use ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))
(global-set-key (kbd "C-x c") 'recentf-ido-find-file)
