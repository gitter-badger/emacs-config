;; Evaluate Emacs Lisp in the Minibuffer
(defun conditionally-enable-paredit-mode ()
  "Enable `paredit-mode' in the minibuffer, during `eval-expression'."
  (if (eq this-command 'eval-expression)
      (paredit-mode 1)))

(add-hook 'minibuffer-setup-hook 'conditionally-enable-paredit-mode)
(global-set-key [M-:] 'eval-expression)

;; Rename current buffer file
(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

(setq elfeed-feeds
      '("https://news.ycombinator.com/rss"
        ;; "http://feeds.feedburner.com/littlebigdetails"
        "http://www.cppblog.com/vczh/Rss.aspx"
        "http://www.nczonline.net/blog/feed/"
        "http://perfectionkills.com/feed/"
        "http://ejohn.org/category/blog/feed/"
        "http://blog.youxu.info/feed/"
        "http://www.verypig.com/?feed=rss2"
        "http://feeds.feedburner.com/yurii"
        "http://www.matrix67.com/blog/feed"
        "http://feeds.feedburner.com/CatChen/Chinese"
        "http://feeds.feedburner.com/yurii"
        "http://feeds.feedburner.com/FlyingMachineStudios"
        "https://www.schneier.com/blog/atom.xml"
        "http://thoughtcrime.org/blog/rss.xml"
        "http://3.14.by/en/rss"
        "http://www.qyjohn.net/?feed=rss2"
        "http://taosay.net/index.php/feed/"
        "http://z.caudate.me/rss/"
        "http://webdam.inria.fr/wordpress/feed/"
        "http://lambda-the-ultimate.org/rss.xml"
        "http://shenfeng.me/atom.xml"
        ))
