;; YASnippet
(require 'yas-jit)
(require 'dropdown-list)
(setq yas/prompt-functions '(
                             yas/ido-prompt
                             yas/dropdown-prompt
                             yas/completing-prompt))
(setq yas/root-directory '(
                           "~/.emacs.d/snippets"
                           "~/.emacs.d/elpa/yasnippet-20130722.1832/snippets/"
                           ))
(setq yas/use-menu 'abbreviate)
(yas/jit-load)
