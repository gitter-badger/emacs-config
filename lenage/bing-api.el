(add-to-list 'load-path "~/.emacs.d/vendor/bing-api")
;; Your bing api client_id.
(defvar bingapi-clientid "412b4e24-9004-48ff-9f71-098f8833e15c")
;; Your bing api client_secret.
(defvar bingapi-clientsecret "bZzzD56oqZpLNJ4t143vQaLovIz0rW8X+BaBWxxGIwY=")
;; list all language codes may be used
(defvar bingtranslate-language-list '("en" "zh-CHS" "ja"))
;; Turn auto detect language code on
(defvar bingtranslate-auto-detect t)

(require 'bing-translate)
;; key bounding
(global-set-key [M-f1] 'bingtranslate-region-or-input)
;; add a pair of language
;; Parameters: "pair name" "from language" "to language"
(bingtranslate-add-pair "1" "zh-CHS" "ja")
