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
                ("wooyun" . "http://www.wooyun.org/index.php")
                ("Linux command list" . "http://www.pixelbeat.org/cmdline_zh_CN.html")
                ("UX" . "http://www.jnd.org/")
                ("Doaj" . "http://www.doaj.org/")
                ("Plos" . "http://www.plos.org/")
                ("MindHacks" . "http://mindhacks.com/")
                ("FlowingData" . "http://flowingdata.com/")
                ("Robot Maker" . "http://www.thingiverse.com/")

                ;; Emacs
                ("Emacs.d" . "http://whattheemacsd.com/")
                ("Emacs Redux" . "http://emacsredux.com/")

                ;; Open Hardware
                ("fritzing" . "http://fritzing.org/projects/")
                ;; User-created parts for fritzing: https://code.google.com/p/fritzing/issues/detail?id=875
                ;;
                ;;CSS
                ("BootCss" . "http://www.bootcss.com/")

                ;; Rails conf
                ("rails conf" . "http://www.josephjaber.com/articles/railsconf-2013-talks")

                ;; OpenClassroom
                ("openclassroom" . "http://openclassroom.stanford.edu/MainFolder/HomePage.php")
                ("bigicheatsheet" . "http://bigocheatsheet.com/#searching")

                ;; Game Dev
                ("Red Blob Games" . "http://www.redblobgames.com/")
                )
              webjump-sample-sites))
