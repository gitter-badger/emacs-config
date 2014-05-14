;; webjump.el
(require 'webjump)
(setq webjump-sites
      (append '(
                ("lenage's blog" . "blog.lenage.com")
                ("markdown online preview"   . "http://benweet.github.io/stackedit")
                ("Github"   . "github.com")
                ("Github Zen"   . "https://api.github.com/zen")
                ("Github stars" . "github.com/stars")
                ("Github Lacoste" . "github.com/theplant/lacoste")
                ("lighthouse" . "theplant.lighthouseapp.com")
                ("Weibo" . "weibo.com")
                ("SICP video Lectures" . "ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/video-lectures/")
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
                ("AnimateCss" . "http://daneden.me/animate/")
                ("Effeckt.css" . "https://github.com/h5bp/Effeckt.css")

                ;; Rails conf
                ("rails conf" . "http://www.josephjaber.com/articles/railsconf-2013-talks")

                ;; OpenClassroom
                ("openclassroom" . "http://openclassroom.stanford.edu/MainFolder/HomePage.php")
                ("bigicheatsheet" . "http://bigocheatsheet.com/#searching")

                ;; Game Dev
                ("Red Blob Games" . "http://www.redblobgames.com/")

                ;; Design
                ("Dribbbleboard" . "http://dribbbleboard.com/")
                ("graffletopia" . "https://www.graffletopia.com/")

                ;; cloud
                ("Jolicloud" . "https://drive.jolicloud.com/")

                ("randomuser" . "http://randomuser.me/")

                ;; VC 的虚拟化
                ("Angel" . "https://angel.co/")
                ;; 科研的虚拟化
                ("science exchane" . "https://www.scienceexchange.com/")
                ("go-language" . "https://github.com/yinwang0/blog-cn/blob/8285c2d2c6846b04f0f4ab73e046fb6247d32fd3/_posts/2013-04-24-go-language.md")

                ;; anthor OS
                ("minix" . "http://www.minix3.org/other/read-more.html")
                )
              webjump-sample-sites))
