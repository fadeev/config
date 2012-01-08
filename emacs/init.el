(require 'cl)
(require 'epa)
(require 'ls-lisp)

(defun load-from (dir)
  (flet ((ex (command) (shell-command-to-string command))
         (em () (file-name-directory load-file-name)))
    (add-to-list 'load-path (concat (em) dir))
    (mapc 'load (split-string (substring (ex (concat "ls " (em) dir)) 0 -1)))))

(load-from "hooks")
(load-from "prefs")

(add-hook 'c-mode-hook 'for-c)
(add-hook 'html-mode-hook 'for-html)
(add-hook 'text-mode-hook 'for-text)
(add-hook 'dired-mode-hook 'for-dired)
