;;; Fonts

;; From: http://community.schemewiki.org/cgi-bin/scheme.cgi?Emacs

;; (and window-system
;;      (create-fontset-from-fontset-spec
;;       (concat
;;        "-apple-monaco-medium-r-normal--12-*-*-*-*-*-fontset-monaco,"
;;        "ascii:-apple-monaco-medium-r-normal--12-100-*-*-m-100-mac-roman"))
;;      )

;; (set-frame-font "Menlo-14")
;; (set-frame-font "Luculent-14")
(set-frame-font "Monaco-14")
(set-fontset-font t 'korean-ksc5601 '("GungSeo" . "unicode-bmp"))
(set-fontset-font t 'han '("Hiragino Sans GB" . "unicode-bmp"))
(set-fontset-font t 'japanese-jisx0208 '("Hiragino Kaku Gothic Pro" . "unicode-bmp"))
;; (set-fontset-font t 'japanese-jisx0212 '("Hiragino Kaku Gothic Pro" . "unicode-bmp"))

;; To change a font size globally:
;; (set-face-attribute 'default nil :height 360)
;; (set-face-attribute 'default nil :height 240)
;; (set-face-attribute 'default nil :height 160)
;; (set-face-attribute 'default nil :height 120)

;; To change the font size interactively per buffer:
;; Up:    C-x C-+, C-x C-=
;; Down:  C-x C--
;; Reset: C-x C-0
