;;; Pretty colors


(color-theme-initialize)
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-color-theme-solarized")
;(color-theme-reset-faces)
(require 'color-theme-solarized)
(color-theme-solarized-dark)
