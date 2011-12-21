(setq backup-directory-alist '(("." . "~/.emacs.d/backups/"))
      backup-by-copying 1
      ido-save-directory-list-file "~/.emacs.d/cache/"
      auto-save-default nil
      org-log-done 1 ; Adds "CLOSED" label with timestamp in org-mode
      inhibit-splash-screen 1
      show-paren-delay 0
      auto-mode-alist (append '(("\\.info$" . Info-on-current-buffer))
                              auto-mode-alist))

(setq-default indent-tabs-mode nil)

(custom-set-variables '(ls-lisp-dirs-first t)
                      '(ls-lisp-use-insert-directory-program nil)
                      '(ls-lisp-verbosity nil))

(menu-bar-mode 0)
(ido-mode 1)
(show-paren-mode 1)