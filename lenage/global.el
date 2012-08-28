;;; Generic emacs settings I cannot live without
(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'flymake)

;; set packages
(require 'package)
(setq package-archives
      '(("original"    . "http://tromey.com/elpa/")
        ("gnu"         . "http://elpa.gnu.org/packages/")
        ("marmalade"   . "http://marmalade-repo.org/packages/")))
(package-initialize)

;; Use command as the meta key
;; (setq ns-command-modifier  'meta)

;; Don't show the startup screen
(setq inhibit-startup-message t)
(setq user-mail-address "lendage@gmail.com")
;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)
;;
;; encoding

(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(setq mac-allow-anti-aliasing t)
;; Highlight regions and add special behaviors to regions.
;; "C-h d transient" for more info
(setq transient-mark-mode t)

;; Display line and column numbers
(setq column-number-mode t)
(setq line-number-mode  t)

;;; Highlight current line
(global-hl-line-mode 1)

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
(setq c-basic-offset 4)
(setq css-indent-offset 2)
(setq sh-basic-offset 2)
(setq-default indent-tabs-mode nil)

(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(setq redisplay-dont-pause t)

(delete-selection-mode t)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(set-fringe-style 0)
(tooltip-mode -1)
(electric-pair-mode t)

;; Display time and data in status bar
(setq display-time-24hr-format t)
(display-time)

;; color-theme
;; (load-theme 'theme-name t)

;; RVM
(rvm-use-default)
(rvm-autodetect-ruby)

;; yasnippet
(yas/load-directory (expand-file-name "snippets" "~/.emacs.d/"))


;; maxframe
(defvar my-fullscreen-p t "Check if fullscreen is on or off")
(defun my-toggle-fullscreen ()
  (interactive)
  (setq my-fullscreen-p (not my-fullscreen-p))
  (if my-fullscreen-p
	  (restore-frame)
	(maximize-frame)))

(global-set-key (kbd "M-RET") 'my-toggle-fullscreen)
