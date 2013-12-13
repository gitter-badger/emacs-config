;;; Interactive do, find-file and iswitchb replacement with fuzzy/flex matching.

(require 'flx-ido)
(ido-mode t)
(ido-everywhere 1)
(setq-default ido-enable-flex-matching t) ; fuzzy matching is a must have
(setq-default ido-enable-last-directory-history nil) ; forget latest selected directory names
(setq-default ido-enable-prefix nil)
(flx-ido-mode 1)
(setq ido-use-faces nil)

(defun recentf-ido-find-file ()
  "Find a recent file use ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))
(global-set-key (kbd "C-x c") 'recentf-ido-find-file)
