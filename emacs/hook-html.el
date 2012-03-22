(defun hook-html ()
  (local-set-key "\t" 'expansion-word))

(setq html-expansion-html
      '("<!DOCTYPE html>\n"
        "<html>\n"
        "  <head>\n"
        "    <meta charset=\"utf-8\">\n"
        "    <meta name=\"description\" content=\"" (read-from-minibuffer "Description: ") "\">\n"
        "    <title>" (read-from-minibuffer "Title: ") "</title>\n"
        "    <link type=\"image/png\" rel=\"shortcut icon\" href=\"\">\n"
        "    <link type=\"text/css\" rel=\"stylesheet\" href=\"" (read-from-minibuffer "Stylesheet href: ") "\">\n"
        "  </head>\n"
        "  <body>\n"
        "    " point "\n"
        "  </body>\n"
        "</html>"))

(setq html-expansion-li
      '("<li>" point "</li>"))

(setq html-expansion-ul
      '("<ul>\n"
        "  <li>" point "</li>\n"
        "</ul>"))

(setq html-expansion-img
      '("<img src=\"" (read-from-minibuffer "src: ") "\""
        "alt=\"" (read-from-minibuffer "alt: ") "\">"))
