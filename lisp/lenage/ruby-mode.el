;;; Ruby

(setq ruby-electric-expand-delimiters-list '(?\' ?\`))

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
     (define-key ruby-mode-map (kbd "C-j") nil)
     )
  )

;; Run the current ruby buffer
(defun ruby-eval-buffer()
   "Evaluate the buffer with ruby."
   (interactive)
   (shell-command-on-region (point-min) (point-max) "ruby"))

;; Local key bindings
(defun lenage-ruby-settings ()
  (interactive)
  (local-set-key [(control meta f1)] 'xmp)
  (local-set-key [(control meta shift f1)] 'ruby-eval-buffer)
  ;; (setq projectile-tags-command "ctags -Re %s `gem env gemdir`/gems/*")
  (subword-mode +1))

(add-hook 'ruby-mode-hook 'lenage-ruby-settings)

;; (add-hook 'ruby-mode-hook 'rubocop-mode)

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
