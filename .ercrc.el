;; Main Settings
(setq erc-nick "lenage"
      erc-user-full-name "Yuan He"
      erc-email-userid "lendage@gmail.com"
      erc-auto-query 'bury
      erc-join-buffer 'bury
      erc-hide-list '("JOIN" "PART" "QUIT")
      erc-log-channels-directory nil)

;; Extra Mode settings
(require 'erc-match)
(setq erc-keywords '("lenage" "Lenage"))
(erc-match-mode)

(erc-scrolltobottom-mode t)
;; Don't track boring activity
(require 'erc-track)
(erc-track-mode t)
(setq erc-track-exclude '("*highlight") ;; ZNC highlight buffer
      erc-track-exclude-server-buffer t
      erc-track-exclude-types
      '("JOIN" "NICK" "PART" "QUIT" "MODE"
        "324" "329" "332" "333" "353" "477"))

(require 'erc-ring)
(erc-ring-mode t)

(require 'erc-netsplit)
(erc-netsplit-mode t)

;; (require 'erc-spelling)
;; (erc-spelling-mode 1)

(erc-timestamp-mode t)
(setq erc-timestamp-format "[%R]")

;; Kill buffers when disconnected or parted
(setq erc-kill-buffer-on-part t
      erc-kill-queries-on-quit t
      erc-kill-server-buffer-on-quit t)

;; Truncate buffers to stop some sluggishness
(setq erc-max-buffer-size 20000)
(erc-truncate-mode t)


(defun erc-cmd-CLEAR ()
  "Clears the current buffer"
  (erc-truncate-buffer-to-size 0))


(defun erc-cmd-CLEARALL ()
  "Clears all ERC buffers"
  (mapc (lambda (buffer)
          (erc-truncate-buffer-to-size 0 (get-buffer buffer)))
        (erc-all-buffer-names)))

;; Autojoin
(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
      '(("ci.theplant-dev.com" "#lacoste")
        (".*a11y.org" "#epub")
        ;; (".*freenode.net" "#emacs" "#html5" "#webkit" "#whatwg" "#rubyonrails" "#go-nuts")
        (".*freenode.net" "#emacs" "#rubyonrails" "#ubuntu-cn" "#haskell" "#clojure" "#haskell.tw")))

(defun djcb-erc-start-or-switch ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (if (get-buffer "irc.freenode.net:6667") ;; ERC already active?

      (erc-track-switch-buffer 1) ;; yes: switch to last active
    (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
      ;; (erc :server "irc.ourirc.com" :port 6668 :nick "lenage")
      ;; (erc :server "irc.w3.org" :port 6667 :nick "lenage")
      (erc :server "irc.freenode.net" :port 6667 :nick "lenage"))))


;; Fill text and try to align it on the same column.
(setq erc-fill-column 150
      erc-fill-function 'erc-fill-static
      erc-fill-static-center 4)

;; Queries in new buffers, notices in current buffer.
(setq erc-auto-query t
      erc-echo-notice-always-hook '(erc-echo-notice-in-active-buffer))

;; ; Logs
(setq erc-log-channels-directory "~/.erc/logs/")
(defadvice save-buffers-kill-emacs (before save-logs (arg) activate)
(save-some-buffers t (lambda () (when (eq major-mode 'erc-mode) t))))
