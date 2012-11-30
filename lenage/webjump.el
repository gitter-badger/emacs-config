;; webjump
(require 'webjump)
(global-set-key "\C-cj" 'webjump)
(setq webjump-sites
      (append '(
                ("lenage's blog" . "blog.lenage.com")
                ("markdown online preview"   . "socrates.io")
                ("Github"   . "github.com")
                ("Github stars" . "github.com/stars")
                ("lighthouse" . "theplant.lighthouseapp.com")
                ("Weibo" . "weibo.com")
                ("Douban" . "www.douban.com")
                ("Douban FM" . "douban.fm")
                ("jing" . "jing.fm")
                ("cnbeta" . "cnbeta.com")
                ("SICP video Lectures" . "ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/video-lectures/")
                ("Qortex" . "qortex.net")
                ("Qortex Dev" . "qortex.theplant-dev.com")
                )
              webjump-sample-sites))
