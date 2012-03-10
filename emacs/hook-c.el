(defun hook-c ()
  (local-set-key "\t" 'expand-word))

(defun c-expand-main ()
  (interactive)
  (insert "int main(int argc, char *argv[]) {\n"
          "  ")
  (insaft "\n"
          "  return 0;\n"
          "}"))

(defun c-expand-inc ()
  (interactive)
  (insert "#include <")
  (insaft ".h>"))

(defun c-expand-def ()
  (insert "#define "))
