;; YASnippet
(require 'yas-jit)
(require 'dropdown-list)
(setq yas/prompt-functions '( yas/ido-prompt
                              yas/dropdown-prompt
                              yas/completing-prompt))
(setq yas/root-directory '(
                           "~/.emacs.d/snippets"
                           "~/.emacs.d/elpa/yasnippet-20121127.25/snippets"
                           "~/.emacs.d/vendor/yasnippets-rails/rails-snippets"
                           "~/.emacs.d/vendor/yasnippets-shoulda"))
(yas/jit-load)
