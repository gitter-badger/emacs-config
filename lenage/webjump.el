;; webjump
(require 'webjump)
(global-set-key "\C-cj" 'webjump)
(setq webjump-sites
      (append '(
                ("lenage's blog" . "blog.lenage.com")
                ("markdown online preview"   . "socrates.io")
                )
              webjump-sample-sites))
