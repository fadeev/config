(defun for-text ()
  (unless (string= "html-mode" major-mode)
    (local-set-key
     "<"
     (lambda ()
       (interactive)
       (cond ((string= "<" (if (char-before) (char-to-string (char-before))))
	      (backward-delete-char 1)
	      (insert "«")
	      (insaft "»"))
	     (t
	      (self-insert-command 1)))))))