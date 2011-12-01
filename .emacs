(require 'cl)
(require 'epa)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups/"))
      backup-by-copying 1
      auto-save-default nil
      org-log-done 1 ; Adds "CLOSED" label with timestamp in org-mode
      indent-tabs-mode nil
      inhibit-splash-screen 1)

(add-to-list 'auto-mode-alist '("\\.info$" . Info-on-current-buffer))

(add-hook 'c-mode-hook 'c-bits)
(add-hook 'html-mode-hook 'html-bits)

(menu-bar-mode 0)
(ido-mode 1)

(global-set-key "(" (lambda () (interactive) (insert "()") (backward-char)))
(global-set-key "[" (lambda () (interactive) (insert "[]") (backward-char)))
(global-set-key "{" (lambda () (interactive) (insert "{}") (backward-char)))
(global-set-key "<" (lambda () (interactive) (insert "<>") (backward-char)))

(global-set-key "\"" (lambda () (interactive) (insert "\"\"") (backward-char)))

(global-set-key "\M-k" 'kill-line-backward)
(global-set-key "\M-/" 'hippie-expand)

(global-set-key "\C-ce" 'executable-interpret)

(defalias 'yes-or-no-p 'y-or-n-p)

(defun insaft (&rest string)
  "Inserts [ string ] after point."
  (let ((start (point)))
    (mapc 'insert string)
    (goto-char start)))

(defun kill-line-backward ()
  (interactive)
  (kill-line 0))

(defun c-bits ()
  (fset 'main
	(lambda ()
	  (interactive)
	  (insert "int main(int argc, char *argv[]) {\n"
		  "  ")
	  (insaft "\n"
		  "  return 0;\n"
		  "}")))
  (fset 'inc
	(lambda ()
	  (interactive)
	  (insert "#include <")
	  (insaft ".h>")))
  (fset 'def
	(lambda ()
	  (interactive)
	  (insert "#define "))))

(defun html-bits ()
  (local-set-key
   "\t"
   (lambda ()
     (interactive)
     (cond ((string= (current-word t) "html")
	    (backward-kill-word 1)
	    (insert "<!DOCTYPE html>\n"
		    "<html>\n"
		    "  <head>\n"
		    "    <meta charset='utf-8'>\n"
		    "    <meta name='description' content='")
	    (insert (read-from-minibuffer "Description: ") "'>\n"
		    "  <title>")
	    (insert (read-from-minibuffer "Title: ") "</title>\n"
		    "    <link type='image/png' rel='shortcut icon' href=''>\n"
		    "    <link tnype='text/css' rel='stylesheet' href='")
	    (insert (read-from-minibuffer "Stylesheet href: ") "'>\n"
		    "  </head>\n"
		    "  <body>\n"
		    "    ")
	    (insaft "\n"
		    "  </body>\n"
		    "</html>"))
     ((string= (current-word t) "li")
      (backward-kill-word 1)
      (insert "<li>")
      (insaft "</li>"))
     (t (indent-according-to-mode)))))
  (fset 'ul
	(lambda ()
	  (interactive)
	  (insert "<ul>\n"
		  "  <li>")
	  (insaft "</li>\n"
			      "</ul>")))
  (fset 'li
	(lambda ()
	  (interactive)
	  (insert "<li>")
	  (insaft "</li>")))
  (fset 'img
	(lambda ()
	  (interactive)
	  (insert "<img src='")
	  (insert (read-from-minibuffer "Image source: ") "'>"))))