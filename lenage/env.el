;;; Environment variables

(setq exec-path (cons "/usr/local/bin" exec-path))
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path (cons "/usr/texbin" exec-path))
(setenv "PATH" (concat "/usr/texbin:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/share/npm/bin" exec-path))
(setenv "PATH" (concat "/usr/local/share/npm/bin:" (getenv "PATH")))
(setq exec-path (cons "/Applications/Emacs.app/Contents/MacOS/bin" exec-path))
(setenv "PATH" (concat "/Applications/Emacs.app/Contents/MacOS/bin:" (getenv "PATH")))
(setq exec-path (cons "~/Library/Haskell/bin/" exec-path))
(setenv "PATH" (concat "~/Library/Haskell/bin:" (getenv "PATH")))
;; Setting rbenv path
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))
;; setting smlng path
(setq exec-path (cons "/usr/local/smlnj-110.75/bin" exec-path))
(setenv "PATH" (concat "/usr/local/smlnj-110.75/bin:" (getenv "PATH")))

;; Set Clojure lein path
(setq exec-path (cons "~/bin" exec-path))
(setenv "PATH" (concat "~/bin:" (getenv "PATH")))
