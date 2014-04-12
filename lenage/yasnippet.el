;; YASnippet
(require 'yasnippet)
(require 'dropdown-list)
(setq yas-prompt-functions '(
                             yas-dropdown-prompt
                             yas-ido-prompt
                             yas-completing-prompt))
(setq yas-snippet-dirs '(
                           "~/.emacs.d/snippets"
                           "~/.emacs.d/elpa/yasnippet-20140314.255/snippets"
                           "~/.emacs.d/vendor/yasnippets-rails/rails-snippets"
                           "~/.emacs.d/vendor/yasnippets-shoulda"))

(setq yas-use-menu 'abbreviate)
(diminish 'yas-minor-mode)

(autoload 'yas-reload-all "yasnippet" "Load yasnippet for yas-reload-all")
(yas-global-mode)
