(defun for-dired ()
  (local-set-key (kbd "<RET>")
		 (lambda ()
		   (interactive)
		   (cond ((file-directory-p (thing-at-point 'filename))
			  (dired-find-file))
			 (t
			  (dired-find-file-other-window))))))