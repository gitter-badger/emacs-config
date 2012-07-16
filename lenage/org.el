;;; org-mode

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/org/work.org"
                             "~/org/home.org"))

(setq org-agenda-custom-commands
      '(("D" "Daliy Action List"
         ((agenda "" ((org-agenda-ndays 1 )
                      (org-agenda-sorting-strategy '(time-up priority-down tag-up))
                      ;; (org-deadline-warning-days 0)
                      ;; (org-agenda-todo-keyword-format "[ ]"))
                      )
                      )))))

;; (global-set-key (kbd "C-c r") 'remember)
;; (add-hook 'remember-mode-hook 'org-remember-apply-template)
;; (setq org-remember-templates
;;       '((?n "* %U %?" "~/org/inbox.org")))
;; (setq remember-annotation-functions '(org-remember-annotation))
;; (setq remember-handler-functions '(org-remember-handler))
