(global-set-key "(" (lambda () (interactive) (insert "()") (backward-char)))
(global-set-key "[" (lambda () (interactive) (insert "[]") (backward-char)))
(global-set-key "{" (lambda () (interactive) (insert "{}") (backward-char)))
(global-set-key "<" (lambda () (interactive) (insert "<>") (backward-char)))

(global-set-key "\"" (lambda () (interactive) (insert "\"\"") (backward-char)))

(global-set-key (kbd "M-k") 'kill-line-backward)
(global-set-key (kbd "C-x C-x") 'next-multiframe-window)

(global-set-key (kbd "C-c C-e") 'executable-interpret)