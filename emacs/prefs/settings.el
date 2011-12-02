(setq backup-directory-alist '(("." . "~/.emacs.d/backups/"))
      backup-by-copying 1
      auto-save-default nil
      org-log-done 1 ; Adds "CLOSED" label with timestamp in org-mode
      indent-tabs-mode nil
      inhibit-splash-screen 1
      show-paren-delay 0
      auto-mode-alist (append '(("\\.info$" . Info-on-current-buffer))
                              auto-mode-alist))

(menu-bar-mode 0)
(ido-mode 1)