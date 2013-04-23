(require 'emms-setup)
(require 'emms-player-mpd)
(emms-devel)
(emms-default-players)

;; setup mpd
(setq emms-player-mpd-server-name "localhost")
(setq emms-player-mpd-server-port "6600")
(setq emms-player-mpd-music-directory "~/Music/")
(add-to-list 'emms-info-functions 'emms-info-mpd)
(add-to-list 'emms-player-list 'emms-player-mpd)

;; mp3info encoding
(setq emms-info-mp3info-coding-system 'gbk
      emms-cache-file-coding-system 'utf-8
      ;; emms-i18n-default-coding-system '(utf-8 . utf-8)
      )

;; show info when start play a song, just playing
(add-hook 'emms-player-started-hook 'emms-show)
(setq emms-show-format "Now Playing: %s"
      emms-info-asynchronously nil
      emms-source-file-default-directory "~/Music/"
      emms-source-list '(emms-source-directory emms-source-default-directory)
      emms-playlist-buffer-name "*Music*"
      )

;; 当播放完当前的歌曲时随机选择下一首歌曲
(add-hook 'emms-player-finished-hook 'emms-random)
(setq emms-player-next-function 'emms-next)
(setq emms-repeat-playlist t)
;; Disable mode-line
;; (emms-mode-line-disable)
;; Don't display songs times info
(setq emms-playing-time-display-format "")
;; 设定更快和灵活的文件目录查找模式
(setq emms-source-file-directory-tree-function
      'emms-source-file-directory-tree-find)

;; 歌词设置
;; (ad-activate 'emms-lyrics-find-lyric)        ;自动下载歌词
;; (setq emms-lyrics-dir my-lyrics-directory)   ;EMMS的歌词目录
;; (setq emms-lyrics-display-format "%s")       ;设置歌词显示格式
;; (setq emms-lyrics-scroll-timer-interval 1.0) ;歌词滚动延迟
;; (setq emms-lyrics-display-on-minibuffer nil) ;在minibuffer中显示歌词
;; (setq emms-lyrics-display-on-modeline nil)   ;在modeline中显示歌词

;; Emms-browser
(setq emms-browser-info-genre-format "%i● %n"
      emms-browser-info-artist-format "%i● %n"
      emms-browser-info-album-format "%i◎ %n"
      emms-browser-info-title-format "%i♪ %n")

;; EMMS 浏览器
(emms-browser-make-filter               ;显示所有
 "EVERYTHING" 'ignore)
(emms-browser-set-filter                ;设置默认的为显示所有
 (assoc "EVERYTHING" emms-browser-filters))
(emms-browser-make-filter               ;只显示文件
 "ALL-FILES" (emms-browser-filter-only-type 'file))
(emms-browser-make-filter               ;最近一个月播放的
 "LAST-MONTH-PLAYED" (emms-browser-filter-only-recent 30))
(emms-browser-make-filter               ;最近一个月都没有播放的
 "LAST-MONTH-NOT-PLAYED"
 (lambda (track)
   (not (funcall (emms-browser-filter-only-recent 30) track))))
(put 'emms-browser-delete-files 'disabled nil) ;删除文件不提醒
(add-hook 'emms-browser-delete-files-hook ;删除封面和目录, 如果删除当前文件后目录已经没有音乐文件了
          'de-kill-covers-and-parents)

;; 设置时间显示格式
(setq emms-last-played-format-alist                      ;最后播放时间格式化
      '(((emms-last-played-seconds-today) . "%H:%M")     ;今天
        (604800                           . "W%w %H:%M") ;这个星期
        ((emms-last-played-seconds-month) . "%d")        ;这个月
        ((emms-last-played-seconds-year)  . "%m-%d")     ;今年
        (t                                . "")))

;; global key-map
(global-set-key (kbd "C-c e m") 'emms-playlist-mode-go)

(global-set-key (kbd "C-c e t") 'emms-play-directory-tree)
(global-set-key (kbd "C-c e x") 'emms-start)
(global-set-key (kbd "C-c e v") 'emms-stop)
(global-set-key (kbd "C-c e n") 'emms-next)
(global-set-key (kbd "C-c e p") 'emms-previous)
(global-set-key (kbd "C-c e o") 'emms-show)
(global-set-key (kbd "C-c e h") 'emms-shuffle)
(global-set-key (kbd "C-c e e") 'emms-play-file)
(global-set-key (kbd "C-c e f") 'emms-play-playlist)
(global-set-key (kbd "C-c e SPC") 'emms-pause)
(global-set-key (kbd "C-c e a") 'emms-add-directory-tree)

(global-set-key (kbd "C-c e r")   'emms-toggle-repeat-track)
(global-set-key (kbd "C-c e R")   'emms-toggle-repeat-playlist)

(global-set-key (kbd "C-c e s u") 'emms-score-up-playing)
(global-set-key (kbd "C-c e s d") 'emms-score-down-playing)
(global-set-key (kbd "C-c e s o") 'emms-score-show-playing)
