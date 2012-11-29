;; yasnippet
;; (yas/load-directory (expand-file-name "snippets" "~/.emacs.d/"))
(require 'yasnippet)
(yas-global-mode 1)
(require 'dropdown-list)
(setq yas/prompt-functions '( yas/ido-prompt
                              yas/dropdown-prompt
                              yas/completing-prompt))
(yas/load-directory "~/.emacs.d/vendor/yasnippets-rails/rails-snippets")
(yas/load-directory "~/.emacs.d/vendor/yasnippets-shoulda")
