(defalias 'yes-or-no-p 'y-or-n-p)

(defun insaft (&rest string)
  "Inserts [ string ] after point."
  (let ((start (point)))
    (mapc 'insert string)
    (goto-char start)))

(defun kill-line-backward ()
  (interactive)
  (kill-line 0))