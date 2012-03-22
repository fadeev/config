(require 'cl)
(require 'epa nil t)
(require 'ls-lisp)

(flet ((run (command) (shell-command-to-string command))
       (dir () (file-name-directory load-file-name)))
  (add-to-list 'load-path (dir))
  (mapc 'load
        (remove (file-name-nondirectory load-file-name)
                (split-string (substring (run (concat "ls " (dir))) 0 -1)))))

(add-hook 'after-change-major-mode-hook 'truncate-lines-unless-text-mode)
(add-hook 'c-mode-hook 'hook-c)
(add-hook 'html-mode-hook 'hook-html)
(add-hook 'text-mode-hook 'hook-text)
(add-hook 'dired-mode-hook 'hook-dired)
(add-hook 'javascript-mode-hook 'hook-javascript)
(add-hook 'haskell-mode-hook 'haskell-doc-mode)
