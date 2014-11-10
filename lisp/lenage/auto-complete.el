;; (require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(ac-config-default)
(setq ac-auto-start 2)
(setq ac-auto-show-menu nil)
(setq ac-use-fuzzy t)
(setq ac-stop-flymake-on-completing t)
(setq ac-dwim nil) ; To get pop-ups with docs even if a word is uniquely completed
;; (setq ac-ignores '("." "=" "@" "[" "]" "(" ")"))
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

;; hook AC into completion-at-point
(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; exclude very large buffers from dabbrev
(defun sanityinc/dabbrev-friend-buffer (other-buffer)
  (< (buffer-size other-buffer) (* 1 1024 1024)))

(setq dabbrev-friend-buffer-function 'sanityinc/dabbrev-friend-buffer)
