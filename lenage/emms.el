(require 'emms-setup)
(emms-devel)
(emms-default-players)

(add-hook 'emms-player-started-hook 'emms-show)
(setq emms-show-format "Now Playing: %s"
      emms-info-asynchronously nil
      emms-source-default-directory "~/Music/iTunes/iTunes Media/"
      emms-source-list '(emms-source-directory emms-source-default-directory)
      emms-playlist-buffer-name "*Music*"
      )

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
