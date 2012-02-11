(setq backup-directory-alist '(("." . "~/.emacs.d/backups/"))
      backup-by-copying 1
      ido-save-directory-list-file "~/.emacs.d/.ido.last"
      ido-enable-flex-matching 1
      auto-save-default nil
      org-log-done 1  ; Adds "CLOSED" label with timestamp in org-mode
      inhibit-splash-screen 1
      show-paren-delay 0
      auto-mode-alist (append '(("\\.info$" . Info-on-current-buffer))
                              auto-mode-alist))

(setq-default indent-tabs-mode nil)

(custom-set-variables '(ls-lisp-dirs-first t)
                      '(ls-lisp-use-insert-directory-program nil)
                      '(ls-lisp-verbosity nil))

(custom-set-faces
 '(fringe ((t (:background "grey95" :foreground "black"))))
 '(highlight ((t (:background "darkseagreen2" :foreground "black"))))
 '(isearch-fail ((t (:background "RosyBrown1" :foreground "black"))))
 '(lazy-highlight ((t (:background "paleturquoise" :foreground "black"))))
 '(match ((t (:background "yellow1" :foreground "black"))))
 '(next-error ((t (:inherit region :foreground "black"))))
 '(region ((t (:background "lightgoldenrod2" :foreground "black"))))
 '(secondary-selection ((t (:background "yellow1" :foreground "black"))))
 '(show-paren-match ((t (:background "turquoise" :foreground "black")))))

(menu-bar-mode 0)
(ido-mode 1)
(show-paren-mode 1)

(global-set-key "(" (lambda () (interactive) (insert "()") (backward-char)))
(global-set-key "[" (lambda () (interactive) (insert "[]") (backward-char)))
(global-set-key "{" (lambda () (interactive) (insert "{}") (backward-char)))
(global-set-key "<" (lambda () (interactive) (insert "<>") (backward-char)))

(global-set-key "\"" (lambda () (interactive) (insert "\"\"") (backward-char)))

(global-set-key (kbd "!") 'insert-hashbang)

(global-set-key (kbd "M-k") 'kill-line-backward)
(global-set-key (kbd "C-c C-c") 'kill-buffer-current)
(global-set-key (kbd "C-x C-x") 'next-multiframe-window)
(global-set-key (kbd "C-c C-e") 'executable-interpret)
