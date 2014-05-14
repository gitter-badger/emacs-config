;;; Generic emacs settings I cannot live without
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
;; (require 'flymake)


;; set packages
(require 'package)
(setq package-archives
      '(("original"    . "http://tromey.com/elpa/")
        ;;("gnu"       . "http://elpa.gnu.org/packages/")
        ("melpa"       . "http://melpa.milkbox.net/packages/")
        ("org"         . "http://orgmode.org/elpa/")
        ))
(package-initialize)

;; Fetch the list of packages available
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar package-list
      '(
        ;; utils
        s f
        ;; Language modes
          ruby-mode yaml-mode clojure-mode coffee-mode go-mode markdown-mode
          lua-mode sass-mode css-mode scss-mode slim-mode json-mode
          skewer-mode scala-mode2 sbt-mode gitconfig-mode engine-mode bundler
          ;; Yasnippet
          yasnippet rfringe ;; yas-jit yasnippet-bundle
          ;; Themes
          ;; solarized-theme subatomic-theme zen-and-art-theme qsimpleq-theme
          ;; Tools
          magit full-ack gist
          col-highlight
          ace-jump-mode
          ac-dabbrev
          key-chord
          projectile rinari undo-tree rainbow-mode todotxt
          diff-hl expand-region diminish dash-at-point dash multiple-cursors
          auto-complete flycheck ac-slime smartparens exec-path-from-shell
          cider git-link powerline
          robocop
          ;; Auto-complete plug-in
          ac-js2
          ;; ERC
          erc-hl-nicks
          ;; Etags
          etags-select
          ;; Fun with Emacs
          nyan-mode tea-time keyfreq elfeed
          emms
          ;; auto-complete dependenes
          popup dropdown-list
          ;;js2-refactor
          ))

;; install the missing packages
(dolist (package package-list)
  (when (not (package-installed-p package))
    (package-install package)))

;; Use command as the meta key
;; (setq ns-command-modifier  'meta)

;; make EasyPG ;; make EasyPG (epa) ask the encryption password just once
(setq-default epa-file-cache-passphrase-for-symmetric-encryption t)
;; 'silent to use symmetric encryption
;; nil to ask for users unless specified
;; t to always ask for a user
(setq-default epa-file-select-keys t)

;; Don't show the startup screen
(setq user-mail-address "lendage@gmail.com")
;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

(setq mac-allow-anti-aliasing t)
;; Highlight regions and add special behaviors to regions.
;; "C-h d transient" for more info
(setq transient-mark-mode t)

;; Display line and column numbers
(setq column-number-mode t)
(setq line-number-mode  t)

;;; Highlight current line
(global-hl-line-mode 1)
(global-diff-hl-mode 1)
;; `diff-hl-diff-goto-hunk'  C-x v =
;; `diff-hl-revert-hunk'     C-x v n
;; `diff-hl-previous-hunk'   C-x v [
;; `diff-hl-next-hunk'       C-x v ]

;; Add newline at end of files
(setq require-final-newline t)

;; Emacs gurus don't need no stinking scroll bars
(when (fboundp 'toggle-scroll-bar)
  (toggle-scroll-bar -1))

;; Explicitly show the end of a buffer
(set-default 'indicate-empty-lines t)

;; Line-wrapping
(set-default 'fill-column 80)

;; Prevent the annoying beep on errors
;; (setq visible-bell t)

;; Make sure all backup files only live in one place
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Gotta see matching parens
(show-paren-mode t)

;; Don't truncate lines
(setq truncate-lines t)
(setq truncate-partial-width-windows nil)

;; For emacsclient
(server-start)

;; Trailing whitespace is unnecessary
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; Trash can support
(setq delete-by-moving-to-trash t)

;; `brew install aspell --lang=en` (instead of ispell)
(setq-default ispell-program-name "aspell")
(setq-default ispell-list-command "list")
(setq-default ispell-extra-args '("--sug-mode=ultra"))

;; Don't display password in shell
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;; tab width
(setq-default tab-width 4)
(setq-default js-indent-level 4)
(setq-default c-basic-offset 4)
(setq-default css-indent-offset 2)
(setq-default sh-basic-offset 2)
(setq-default indent-tabs-mode nil)
(setq vc-follow-symlinks t)

(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(setq redisplay-dont-pause t)

(delete-selection-mode t)
(set-fringe-style 4)
(tooltip-mode 1)
;; disable since use smartparens mode
;; (electric-pair-mode t)
(icomplete-mode 1)
;; Display time and date in status bar
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq size-indication-mode t)

;; Global undo tree
;; C-x u show undotree visualize
(global-undo-tree-mode)

;; ;; Global auto-revert mode when file changes
(global-auto-revert-mode 1)

;;;; auto-save mode on
(setq auto-save-default t)


;; enable which func mode  http://emacsredux.com/blog/2014/04/05/which-function-mode/
(add-to-list 'which-function-mode 'ruby-mode)
(add-to-list 'which-function-mode 'python-mode)
(add-to-list 'which-function-mode 'emacs-lisp-mode)
(add-to-list 'which-function-mode 'js2-mode)
(setq which-func-unknown "n/a")

;; Show the current function name in the header line
(which-function-mode)
;; (setq-default header-line-format
;;               '((which-func-mode ("" which-func-format " "))))
;; (setq mode-line-misc-info
;;             ;; We remove Which Function Mode from the mode line, because it's mostly
;;             ;; invisible here anyway.
;;             (assq-delete-all 'which-func-mode mode-line-misc-info))


;; color-theme
;; (load-theme 'solarized-light t)
(load-theme 'misterioso t)
;; (load-theme 'qsimpleq t)                ;soft and clean white background color-theme
;; (load-theme 'zen-and-art t)             ; nice dark theme
;; (load-theme 'pastels-on-dark t)
;; (load-theme 'subatomic t)

;; see M-/ in binding.el
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

;; Highlight Lines That Exceed a Certain Length Limit
;; (require 'whitespace)
;; (setq whitespace-line-column 80) ;; limit line length
;; (setq whitespace-style '(face lines-tail))
;; (add-hook 'prog-mode-hook 'whitespace-mode)
;; (global-whitespace-mode +1)

;;  todotxt config
(require 'todotxt)
(setq todotxt-file "~/.todo/todo.txt")
(global-set-key (kbd "C-x t") 'todotxt)

;; powerline
;; (require 'powerline)
;; (powerline-default-theme)

;; Tea Time
(require 'tea-time)
(setq tea-time-sound "~/Music/notifications/Shots-letsgo.m4a")
(setq tea-time-sound-command "afplay %s")

;; mode line custom
(when (require 'diminish nil 'noerror)
  (diminish 'undo-tree-mode)
  (diminish 'abbrev-mode))

(custom-set-variables '(tramp-verbose 0))
(setq-default gnus-select-method '(nntp "news.gwene.org"))

(require 'rfringe)
(require 'bundler)

;; enable projectile global
(projectile-global-mode)
(setq projectile-enable-caching t)
;;;; ac-js2 mode
;; (setq ac-js2-evaluate-calls t)
;; (add-to-list 'ac-js2-external-libraries "path/to/lib/library.js")
;; To add completions for external libraries add something like this:

;; disable sass complication on save
(setq scss-compile-at-save nil)

;; enable engine-mode to config custom search
(require 'engine-mode)
(engine-mode t)

(defengine wolfram-alpha
  "http://www.wolframalpha.com/input/?i=%s")

(defengine stack-overflow
  "https://stackoverflow.com/search?q=%s"
  "s")

(defengine rfcs
  "http://pretty-rfc.herokuapp.com/search?q=%s")

(defengine github
  "https://github.com/search?ref=simplesearch&q=%s"
  "g")

(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  "o")

(defengine duckduckgo
  "https://duckduckgo.com/?q=%s"
  "d")

(defengine wikipedia
  "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
  "w")

;; org-journal
(require 'org-journal)
(setq org-journal-dir "~/org/life/journal/")
