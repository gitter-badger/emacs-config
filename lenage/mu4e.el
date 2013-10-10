(require 'mu4e)

;; use mu4e to sending email
(setq mail-user-agent 'mu4e-user-agent)
(setq mu4e-attachment-dir  "~/Downloads")
;; default mail folder
(setq mu4e-maildir (expand-file-name "~/Maildir"))
;; Viewing Rich-text email
(setq mu4e-html2text-command "html2text -utf8 -width 72")

;; Viewing images inline
(setq mu4e-view-show-images t)
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

(add-to-list 'mu4e-view-actions
            '("ViewInBrowser" . mu4e-action-view-in-browser) t)

;; toggle between including/not-including with W.
(setq mu4e-headers-include-related t)
;; ;; toggle between skipping/not-skipping with V.
(setq mu4e-headers-skip-duplicates t)

;; Default account
(setq mu4e-sent-folder "/Personal/[Gmail].Sent Mail"
      mu4e-drafts-folder "/Personal/[Gmail].Drafts"
      mu4e-trash-folder  "/Personal/[Gmail].Trash")

(defvar lenage-mu4e-account-alist
  '(("Personal"
     (mu4e-sent-folder "/Personal/[Gmail].Sent Mail")
     (mu4e-drafts-folder "/Personal/[Gmail].Drafts")
     (mu4e-trash-folder  "/Personal/[Gmail].Trash")
     (user-mail-address "lendage@gmail.com")
     (user-full-name  "Yuan He")
     (message-signature (concat "Yuan Hu\n" "http://blog.lenage.com\n")))
    ("Work"
     (mu4e-sent-folder "/Work/[Gmail].Sent Mail")
     (mu4e-drafts-folder "/Work/[Gmail].Drafts")
     (mu4e-trash-folder  "/Work/[Gmail].Trash")
     (user-mail-address "lendage@theplant.jp")
     (message-signature (concat "Yuan Hu\n" "ThePlant.co.,Ltd.")))))

(defun lenage-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var)) lenage-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) lenage-mu4e-account-alist)
                             nil t nil nil (caar lenage-mu4e-account-alist))))
         (account-vars (cdr (assoc account lenage-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

 (add-hook 'mu4e-compose-pre-hook 'lenage-mu4e-set-account)
;; don't save message to Sent Messages, GMail/IMAP will take care of this
(setq mu4e-sent-messages-behavior 'delete)

;; setup some handy shortcuts
(setq mu4e-maildir-shortcuts
      '(("/Work/INBOX"             . ?i)
        ("/Work/[Gmail].Sent Mail" . ?s)
        ("/Work/[Gmail].Trash"     . ?t)
        ("/Work/[Gmail].Drafts"    . ?d)
        ("/Work/Follow up"         . ?f)
        ))

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu, 'gnutls' in Archlinux.

(require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-starttls-credentials
      '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials
      (expand-file-name "~/.authinfo.gpg")
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t)

 ;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)
;; hooks
(defun lenage-mu4e-view-mode-hook()
  (interactive)
  ;; (mu4e-view-toggle-hide-cited)
  )

(add-hook 'mu4e-view-mode-hook 'lenage-mu4e-view-mode-hook)

;; Main View
(add-to-list 'mu4e-bookmarks '("maildir:/Personal/INBOX OR maildir:/Work/INBOX flag:unread"   "Today's news"   ?n))
(add-to-list 'mu4e-bookmarks '("maildir:/Work/Llighthouse"   "Work Lighthouse"   ?h))
