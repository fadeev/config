(defun hook-c ()
  (local-set-key "\t" 'expansion-word))

(setq c-expansion-main
      '("int main(int argc, char *argv[]) {\n"
        point "\n"
        "return 0;\n"
        "}"))

(setq c-expansion-inc
      '("#include <" point ".h>"))

(setq c-expansion-def
      '("#define "))
