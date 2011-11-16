(require 'cl)

(require 'epa) ; GPG encryption in org-mode
(epa-file-enable)
(setq org-log-done 1) ; Adds "CLOSED" label with timestamp in org-mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq backup-directory-alist `(("." . "~/.emacs.d/backups/")))
(setq backup-by-copying 1)
(setq auto-save-default nil)

(setq-default indent-tabs-mode nil)
(global-set-key (kbd "M-/") 'hippie-expand)

(add-hook 'c-mode-hook 'c-bits)
(add-hook 'html-mode-hook 'html-bits)

(defalias 'yes-or-no-p 'y-or-n-p)
(setq inhibit-splash-screen 1)
(menu-bar-mode 0)
(ido-mode 1)

(defun c-bits ()
  (fset 'main
        "int main(int argc, char *argv[]) {\C-m  \C-m return 0;\C-m}\C-p\C-p\C-e")
  (fset 'inc
        "#include <.h>\C-b\C-b\C-b")
  (fset 'def
        "#define "))

(defun html-bits ()
  (fset 'html
        "<!DOCTYPE html>\C-m<html>\C-m  <head>\C-m    <meta charset='utf-8'>\C-m    <meta name='description' content=''>\C-m    <title></title>\C-m    <link type='image/png' rel='shortcut icon' href=''>\C-m    <link type='text/css' rel='stylesheet' href=''>\C-m  </head>\C-m  <body>\C-m  \C-m  </body>\C-m</html>\C-p\C-p\C-e")
  (fset 'ul
        "<ul>\C-m  <li></li>\C-m</ul>\C-p\C-f")
  (fset 'img
        "<img src=\"\">\C-b\C-b"))