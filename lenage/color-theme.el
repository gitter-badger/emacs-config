;;; Pretty colors

(color-theme-initialize)
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-color-theme-solarized")
;(color-theme-reset-faces)
(require 'color-theme-solarized)
(color-theme-solarized-dark)
;; Color-schemes that I thought were pleasing to the eye.  Most others are
;; pretty ugly.

;; Dark Backgrounds
;; (color-theme-dark-laptop)
;; (color-theme-clarity)
;; (color-theme-goldenrod)
;; (color-theme-billw)

;; Light Backgrounds
;; (color-theme-sitaramv-nt)
;; (color-theme-pierson)
;; (color-theme-rotor)
;; (color-theme-emacs-21)
;; (color-theme-gtk-ide)

(set-face-foreground 'region "white")
(set-face-background 'region "slategray")

(blink-cursor-mode)
(set-cursor-color "orange")
