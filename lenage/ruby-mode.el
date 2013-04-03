;;; Ruby

(defalias 'ri 'yari)
(global-set-key (kbd "C-h r") 'ri)


;; patches your # key to automatically expand to #{} when typed inside a double quoted string.
(defun senny-ruby-interpolate ()
  "In a double quoted string, interpolate."
  (interactive)
  (insert "#")
  (when (and
         (looking-back "\".*")
         (looking-at ".*\""))
    (insert "{}")
    (backward-char 1)))

(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "#") 'senny-ruby-interpolate)
     (define-key ruby-mode-map (kbd "TAB") nil)
     )
  )

;; Run the current ruby buffer
(defun ruby-eval-buffer()
   "Evaluate the buffer with ruby."
   (interactive)
   (shell-command-on-region (point-min) (point-max) "ruby"))

;; Local key bindings
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key [(control meta f1)] 'xmp)
            (local-set-key [(control meta shift f1)] 'ruby-eval-buffer)
            (electric-pair-mode 0)
            (subword-mode +1)
            ))

(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("autotest$" . ruby-mode))
(add-to-list 'auto-mode-alist '("irbrc$" . ruby-mode))
(add-to-list 'auto-mode-alist '("sake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("god$" . ruby-mode))
(add-to-list 'auto-mode-alist '("thor$" . ruby-mode))
