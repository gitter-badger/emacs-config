;;; Generic emacs settings I cannot live without
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'flymake)


;; set packages
(require 'package)
(setq package-archives
      '(("original"    . "http://tromey.com/elpa/")
        ("gnu"         . "http://elpa.gnu.org/packages/")
        ("marmalade"   . "http://marmalade-repo.org/packages/")
        ("melpa"       . "http://melpa.milkbox.net/packages/")
        ))
(package-initialize)

;; Fetch the list of packages available
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar package-list
      '(
        ;; Language modes
        ruby-mode yaml-mode clojure-mode coffee-mode go-mode markdown-mode
                  lua-mode sass-mode css-mode scss-mode slim-mode
                  ;; Yasnippet
                  yasnippet yari yas-jit yasnippet-bundle rfringe
                  ;; Themes
                  ;; solarized-theme subatomic-theme zen-and-art-theme qsimpleq-theme
                  ;; Tools
                  magit full-ack gist col-highlight ace-jump-mode ac-dabbrev
                  find-file-in-project rinari undo-tree rainbow-mode todotxt
                  diff-hl expand-region diminish dash-at-point dash multiple-cursors
                  auto-complete flycheck
                  ;; Fun with Emacs
                  nyan-mode tea-time keyfreq elfeed
                  ;; auto-complete dependenes
                  popup
                  ))

;; install the missing packages
(dolist (package package-list)
  (when (not (package-installed-p package))
    (package-install package)))

;; Use command as the meta key
;; (setq ns-command-modifier  'meta)

;; Disable warnning while edit emacs lisp scripts
(eval-after-load 'flycheck '(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))

;; make EasyPG ;; make EasyPG (epa) ask the encryption password just once
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
;; 'silent to use symmetric encryption
;; nil to ask for users unless specified
;; t to always ask for a user
(setq epa-file-select-keys t)

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
(setq ispell-list-command "list")
(setq ispell-extra-args '("--sug-mode=ultra"))

;; Don't display password in shell
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;; tab width
(setq-default tab-width 2)
(setq js-indent-level 2)
(setq c-basic-offset 2)
(setq css-indent-offset 2)
(setq sh-basic-offset 2)
(setq-default indent-tabs-mode nil)

(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(setq redisplay-dont-pause t)

(delete-selection-mode t)
(set-fringe-style 4)
(tooltip-mode 1)
(electric-pair-mode t)
(icomplete-mode 1)
;; Display time and date in status bar
(setq display-time-24hr-format t)
(setq display-time-mode 1)
(setq size-indication-mode 1)

;; Global undo tree
;; C-x u show undotree visualize
(global-undo-tree-mode)

;; ;; Global auto-revert mode when file changes
(global-auto-revert-mode 1)

;;;; auto-save mode on
(setq auto-save-default t)

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

;; Diminish
(require 'diminish)
(diminish 'undo-tree-mode)
(diminish 'yas/minor-mode)
;; (diminish 'subword-mode)

(custom-set-variables '(tramp-verbose 0))
(setq gnus-select-method '(nntp "news.gwene.org"))

(require 'rfringe)

;;;; ac-js2 mode
;; (setq ac-js2-evaluate-calls t)
;; (add-to-list 'ac-js2-external-libraries "path/to/lib/library.js")
;; To add completions for external libraries add something like this:
