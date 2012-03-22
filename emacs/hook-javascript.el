(defun hook-javascript ()
  (local-set-key "\t" 'expansion-word))

(setq javascript-expansion-fun
      '("function " (read-from-minibuffer "name: ") " () {\n"
        point "\n"
        "};"))
