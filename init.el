(add-to-list 'load-path "~/.emacs.d/lisp")

;; Turn off mouse interface early in startup to avoid momentary display
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(unless (display-graphic-p) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

(load "lenage")
