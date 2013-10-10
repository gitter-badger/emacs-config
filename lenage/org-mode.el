;;; org-mode

(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/org/"))

(setq org-agenda-custom-commands
      '(("D" "Daily Action List"
         (
          (agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up) )))
                      (org-deadline-warning-days 0)
                      ))))))



(setq org-todo-keywords
      '((sequence "TODO" "OPEN" "COMMITTED" "PENDING_REVIEW" "|" "DONE" "DELEGATED" "PENDING_REPLY")))
