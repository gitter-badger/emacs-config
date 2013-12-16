;;; Global key bindigns

;; How to Define Keyboard Shortcuts in Emacs
;; http://xahlee.org/emacs/keyboard_shortcuts.html

(global-set-key (kbd "C-M-h") 'backward-kill-word)

;; Keyboard macros
(global-set-key [(shift f4)] 'kmacro-start-macro-or-insert-counter)

;; Refresh-like
(global-set-key [(f5)]         'revert-buffer)
(global-set-key [(control f5)] 'revbufs)

;; Indenting and alignment
(global-set-key [(f8)]         'indent-region)
(global-set-key [(control f8)] 'align)
(global-set-key [(shift f8)]   'align-current)
(global-set-key (kbd "C-x \\")    'align-regexp)

;; Version control and change related
(global-set-key [(control f9)] (lambda () (interactive) (magit-status default-directory)))
(global-set-key [(f9)]         (lambda () (interactive) (magit-status default-directory)))

;; Repeat
(global-set-key [(control z)] 'repeat) ; was suspend-frame

;; Window navigation
(windmove-default-keybindings 'meta)

;; Mac OS X conventions
;;(global-set-key (kbd "M-a") 'mark-whole-buffer) ; was backward-sentence.

;; Don't use Alt+x, controller instead
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Find matching parens
(global-set-key (kbd "C-'") 'match-paren)

;; Copry current buffer file name to clipboard
(global-set-key (kbd "C-c C-p") 'prelude-copy-file-name-to-clipboard)

;; Easy inserts
(global-set-key (kbd "C-.") 'insert-arrow)

;; ibuffer > list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Improved navigation and editing (assumes misc.el)
(global-set-key (kbd "M-Z") 'zap-up-to-char)
(global-set-key (kbd "M-F") 'forward-to-word)
(global-set-key (kbd "M-B") 'backward-to-word)

;; Completion that uses many different methods to find options
(global-set-key (kbd "M-/") 'hippie-expand)

;; ace-jump-mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; font-size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; use regex search by default
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x C-p") 'find-file-at-point)
(global-set-key (kbd "C-x f") 'find-file-in-project)

;; window switching
(windmove-default-keybindings) ;; Shift+direction
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two

;; Indentation help
(global-set-key (kbd "C-x j") 'join-line)
(global-set-key (kbd "C-j") 'indent-new-comment-line)

(global-set-key (kbd "C-c c") 'duplicate-line)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; multiple-cursor
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; move current line up or down
(global-set-key [(meta shift up)]  'move-line-up)
(global-set-key [(meta shift down)]  'move-line-down)

;; ;; Kill Other Buffers
(global-set-key (kbd "C-c k") 'kill-other-buffers)

;; ;; Google
(global-set-key (kbd "C-c g") 'google)

;; ;; Indent Region or Buffer
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; ;; open with
(global-set-key (kbd "C-c o") 'open-with)

;; ;; smart open line
(global-set-key [(shift return)] 'smart-open-line)
;; ;; dash search at point
(global-set-key (kbd "C-c d") 'dash-at-point)

;;;; js2-refactor mode
(js2r-add-keybindings-with-prefix "C-c m")

;; key chords
(require 'key-chord)

(key-chord-define-global "jj" 'ace-jump-word-mode)
(key-chord-define-global "jl" 'ace-jump-line-mode)
(key-chord-define-global "jk" 'ace-jump-char-mode)
(key-chord-define-global "uu" 'undo-tree-visualize)

(key-chord-mode +1)

;; make some use of the Super key
(define-key global-map [?\s-d] 'projectile-find-dir)
(define-key global-map [?\s-f] 'projectile-find-file)
(define-key global-map [?\s-g] 'projectile-grep)
(define-key global-map [?\s-m] 'magit-status)
(define-key global-map [?\s-w] 'delete-frame)
(define-key global-map [?\s-p] 'projectile-switch-project)

;; TAGS
(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)
