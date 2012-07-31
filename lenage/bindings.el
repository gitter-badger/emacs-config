;;; Global key bindigns

;; How to Define Keyboard Shortcuts in Emacs
;; http://xahlee.org/emacs/keyboard_shortcuts.html

(global-set-key (kbd "C-M-h") 'backward-kill-word)

;; Keyboard macros
(global-set-key [(shift f4)] 'kmacro-start-macro-or-insert-counter)
;; (global-set-key [(f4)]    'kmacro-end-or-call-macro)  ;; already defined

;; Refresh-like
(global-set-key [(f5)]         'revert-buffer)
(global-set-key [(control f5)] 'revbufs)

;; Indenting and alignment
(global-set-key [(f8)]         'indent-region)
(global-set-key [(control f8)] 'align)
(global-set-key [(shift f8)]   'align-current)
(global-set-key (kbd "C-x \\")    'align-regexp)

;; Version control and change related
;(global-set-key [(control f9)]      'rails-svn-status-into-root)  ;; Move to rails mode?
;(global-set-key [(control meta f9)] (lambda () (interactive) (svn-status default-directory)))
(global-set-key [(control f9)] (lambda () (interactive) (magit-status default-directory)))
(global-set-key [(f9)]         (lambda () (interactive) (magit-status default-directory)))
;;(global-set-key [(meta f9)]    'autotest-switch)  ;; Move to ruby/rails mode?

;; Repeat
(global-set-key [(control z)] 'repeat) ; was suspend-frame

;; Window navigation
(windmove-default-keybindings 'meta)

;; Mac OS X conventions
;;(global-set-key (kbd "M-a") 'mark-whole-buffer) ; was backward-sentence.

;; Find matching parens
(global-set-key (kbd "C-'") 'match-paren)

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

;; window switching
(windmove-default-keybindings) ;; Shift+direction
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two

;; Indentation help
(global-set-key (kbd "C-x j") 'join-line)

;; Mark-multiple and friends
(defun duplicate-line ()
  (interactive)
  (save-excursion
    (let ((line-text (buffer-substring-no-properties
                      (line-beginning-position)
                      (line-end-position))))
      (move-end-of-line 1)
      (newline)
      (insert line-text))))

(global-set-key (kbd "C-c p") 'duplicate-line)
