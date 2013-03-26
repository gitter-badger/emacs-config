;; webjump
(require 'webjump)
(global-set-key "\C-cj" 'webjump)
(setq webjump-sites
      (append '(
                ("lenage's blog" . "blog.lenage.com")
                ("markdown online preview"   . "socrates.io")
                ("Github"   . "github.com")
                ("Github stars" . "github.com/stars")
                ("Github Lacoste" . "github.com/theplant/lacoste")
                ("lighthouse" . "theplant.lighthouseapp.com")
                ("Weibo" . "weibo.com")
                ("Douban" . "www.douban.com")
                ("Douban FM" . "douban.fm")
                ("jing" . "jing.fm")
                ("cnbeta" . "cnbeta.com")
                ("SICP video Lectures" . "ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/video-lectures/")
                ("Qortex" . "qortex.net")
                ("Qortex Dev" . "qortex.theplant-dev.com")
                ("character code" . "character-code.com")
                ("ppurl" . "ppurl.com")
                ("html5please" . "html5please.com")
                ("ruby Regex" . "rubular.com")
                ("favorite icon" . "converticon.com")
                ("west wing" . "www.yyets.com/php/resource/10070")
                ("teavana" . "www.teavana.com/")
                )
              webjump-sample-sites))
