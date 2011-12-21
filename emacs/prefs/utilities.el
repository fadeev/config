(defalias 'yes-or-no-p 'y-or-n-p)

(defun insaft (&rest string)
  "Inserts [ string ] after point."
  (let ((start (point)))
    (mapc 'insert string)
    (goto-char start)))

(defun kill-line-backward ()
  (interactive)
  (kill-line 0))

(defun insert-hashbang ()
  (interactive)
  (flet ((after-hash? () (string= "#" (if (char-before)
                                          (char-to-string (char-before))))))
    (cond ((and (after-hash?) (eq major-mode 'ruby-mode))
           (insert "!/usr/bin/env ruby"))
          ((and (after-hash?) (eq major-mode 'python-mode))
           (insert "!/usr/bin/env python"))
          ((and (after-hash?) (eq major-mode 'sh-mode))
           (insert "!/usr/bin/env sh"))
          (t
           (self-insert-command 1)))))