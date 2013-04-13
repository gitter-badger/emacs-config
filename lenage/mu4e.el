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

(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/[Gmail].Trash")

;; don't save message to Sent Messages, GMail/IMAP will take care of this
(setq mu4e-sent-messages-behavior 'delete)

;; setup some handy shortcuts
(setq mu4e-maildir-shortcuts
      '(("/INBOX"             . ?i)
        ("/[Gmail].Sent Mail" . ?s)
        ("/[Gmail].Trash"     . ?t)
        ("/Follow up"         . ?f)
        ))

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

;; something about ourselves
(setq
 user-mail-address "lendage@gmail.com"
 user-full-name  "Yuan He"
 message-signature
  (concat
    "Yuan Hu\n"
    "http://blog.lenage.com\n")
)

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
  (mu4e-view-toggle-hide-cited))

(add-hook 'mu4e-view-mode-hook 'lenage-mu4e-view-mode-hook)
