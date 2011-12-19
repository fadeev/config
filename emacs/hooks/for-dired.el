(defun for-dired ()
  (shrink-dired-window)
  (local-set-key (kbd "<RET>")
		 (lambda ()
		   (interactive)
		   (cond ((file-directory-p (thing-at-point 'filename))
			  (dired-find-file))
			 (t
			  (dired-find-file-other-window))))))
(defun shrink-dired-window ()
  (if (eq (count-windows) 1)
      (split-window-horizontally))
  (shrink-window-horizontally (- (window-width) 10))
  (enlarge-window-horizontally 50))