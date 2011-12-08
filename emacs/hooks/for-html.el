(defun for-html ()
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
	   ((string= (current-word t) "ul")
	    (backward-kill-word 1)
	    (insert "<ul>\n"
		    "  <li>")
	    (insaft "</li>\n"
		    "</ul>"))
	   ((string= (current-word t) "img")
	    (backward-kill-word 1)
	    (insert "<img src='")
	    (insert (read-from-minibuffer "Image source: ") "'>"))
	   (t (indent-according-to-mode))))))