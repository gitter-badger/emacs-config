(add-to-list 'load-path "~/.emacs.d")

(load "lenage")
(global-linum-mode 1)
(set-frame-height (selected-frame) 40)
(set-frame-width (selected-frame) 80)
;; Enable a backtrace when problems occur
;; (setq debug-on-error t)

(setq path "/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin")
(setenv "PATH" path)
(push "/usr/local/bin" exec-path)

(setq default-input-method "MacOSX")
(setq ns-command-modifier 'meta)
(setq mac-allow-anti-aliasing t)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq js-indent-level 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(setq redisplay-dont-pause t)

;; encoding

(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode t)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode)
(set-fringe-style 0)
(tooltip-mode -1)
(global-auto-revert-mode 1)'

