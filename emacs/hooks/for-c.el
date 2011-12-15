(defun for-c ()
  (local-set-key
   "\t"
   (lambda ()
     (interactive)
     (cond ((string= (current-word t) "main")
	    (backward-kill-word 1)
	    (insert "int main(int argc, char *argv[]) {\n"
		    "  ")
	    (insaft "\n"
		    "  return 0;\n"
		    "}"))
	   ((string= (current-word t) "inc")
	    (backward-kill-word 1)
	    (insert "#include <")
	    (insaft ".h>"))
	   ((string= (current-word t) "def")
	    (backward-kill-word 1)
	    (insert "#define "))
	   (t
	    (indent-according-to-mode))))))