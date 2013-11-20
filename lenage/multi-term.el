(setq multi-term-program "/usr/local/bin/zsh"
      multi-term-dedicated-select-after-open-p t)

(add-hook 'term-mode-hook
          (lambda ()
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))
            (setq term-buffer-maximum-size 10000)
            (setq show-trailing-whitespace nil)
            (ansi-color-for-comint-mode-on)
            (yas-minor-mode -1)
            ))
