;; ; Personal abbreviations
(define-abbrev-table 'global-abbrev-table '(

    ;; math/unicode symbols
    ("8in" "∈")
    ("8nin" "∉")
    ("8inf" "∞")
    ("8luv" "♥")
    ("8smly" "☺")
    ("8la" "λ")
    ("8rt" "√")
    ("8->" "→")
    ("8>=" "≥")
    ("8!=" "≠")
    ("8a" "α")
    ("8b" "β")
    ("8p" "π")
    ("8sum" "∑")
    ))

;; stop asking whether to save newly added abbrev when quitting emacs
(setq save-abbrevs nil)

;; turn on abbrev mode globally
(setq-default abbrev-mode t)
