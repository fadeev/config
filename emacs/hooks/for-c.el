(defun for-c ()
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