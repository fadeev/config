(setq backup-directory-alist `(("." . "~/.emacs.d/backups/")))
(setq backup-by-copying t)
(setq-default indent-tabs-mode nil)

(add-hook 'c-mode-hook
          '(lambda () 
             ((fset 'main
                    "int main(int argc, char *argv[]) {\C-m  \C-m return 0;\C-m}\C-p\C-p\C-e")
              (fset 'inc
                    "#include <.h>\C-b\C-b\C-b")
              (fset 'def
                    "#define ")))
