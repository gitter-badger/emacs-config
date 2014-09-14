;;; org-mode

(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq-default org-clock-history-length 23
      org-clock-in-resume t
      org-clock-into-drawer t
      org-clock-out-remove-zero-time-clocks t
      org-clock-out-when-done t
      org-clock-persist 'history
      org-clock-persist-query-resume nil
      org-log-done 'time
      org-timer-default-timer 25
      )

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t) (python . t) (ruby . t) (sh . t) (sql . nil)))

(setq-default org-agenda-custom-commands
      '(("D" "Daily Action List"
         (
          (agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up) )))
                      (org-deadline-warning-days 0)))))))

;; highlight code blocks
(setq org-src-fontify-natively t)
(setq org-todo-keywords
      '((sequence "TODO" "OPEN" "COMMITTED" "PENDING_REVIEW" "|" "DONE" "DELEGATED" "PENDING_REPLY")))
