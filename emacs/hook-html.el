(defun hook-html ()
  (local-set-key "\t" 'expand-word))

(defun html-expand-html ()
  (interactive)
  (insert "<!DOCTYPE html>\n"
          "<html>\n"
          "  <head>\n"
          "    <meta charset=\"utf-8\">\n"
          "    <meta name=\"description\" content=\"")
  (insert (read-from-minibuffer "Description: ") "\">\n"
          "    <title>")
  (insert (read-from-minibuffer "Title: ") "</title>\n"
          "    <link type=\"image/png\" rel=\"shortcut icon\" href=\"\">\n"
          "    <link type=\"text/css\" rel=\"stylesheet\" href=\"")
  (insert (read-from-minibuffer "Stylesheet href: ") "\">\n"
          "  </head>\n"
          "  <body>\n"
          "    ")
  (insaft "\n"
          "  </body>\n"
          "</html>"))

(defun html-expand-li ()
  (interactive)
  (insert "<li>")
  (insaft "</li>"))

(defun html-expand-ul ()
  (interactive)
  (insert "<ul>\n"
          "  <li>")
  (insaft "</li>\n"
          "</ul>"))

(defun html-expand-img ()
  (interactive)
  (insert "<img src=\"")
  (insert (read-from-minibuffer "Image source: ") "\"")
  (insert " alt=\"")
  (insert (read-from-minibuffer "Image alt: ") "\">"))
