(eval-after-load "multi-term"
  '(setq multi-term-program "/usr/local/bin/zsh"
         multi-term-buffer-name "term"
         term-term-name "xterm-256color"
         multi-term-dedicated-select-after-open-p t))

(add-hook 'term-mode-hook
          (lambda ()
            (copy-face 'default 'term-face)
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))
            (setq term-buffer-maximum-size 10000)
            (setq show-trailing-whitespace nil)
            (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")
            (ansi-color-for-comint-mode-on)
            (yas-minor-mode -1)

            ;; awesome bindings available!
            (compilation-shell-minor-mode t)
            (define-key term-raw-map (kbd "C-y") 'term-paste)

            (cl-flet ((set-color (pair)
                                 (multiple-value-bind (face color)
                                     pair
                                   (set-face-attribute face
                                                       nil
                                                       :foreground color
                                                       :background nil))))
              (mapc #'set-color
                    '((term-color-black "#2e3434")
                      (term-color-red "tomato")
                      (term-color-green "#6ac214")
                      (term-color-yellow "#edd400")
                      (term-color-blue "light sky blue")
                      (term-color-magenta "magenta")
                      (term-color-cyan "cyan")
                      (term-color-white "#eeeeec"))))

            (setq-default ansi-term-color-vector
                          [term-face
                           term-color-black
                           term-color-red
                           term-color-green
                           term-color-yellow
                           term-color-blue
                           term-color-magenta
                           term-color-cyan
                           term-color-white
                           ])
            ;; Key binding
            ))




(global-set-key (kbd "C-c T") 'multi-term)
