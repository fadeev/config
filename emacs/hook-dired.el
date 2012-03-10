(defun hook-dired ()
  (shrink-window-dired)
  (local-set-key (kbd "<RET>") 'dired-find-file-directory-kill-previous))

(defun shrink-window-dired ()
  (cond ((eq (count-windows) 1)
         (split-window-horizontally)))
  (cond ((> (frame-width) 120)
         (shrink-window-horizontally (- (window-width) 10))
         (enlarge-window-horizontally (/ (frame-width) 6)))))

(defun dired-find-file-directory-kill-previous ()
  (interactive)
  (cond ((file-directory-p (thing-at-point 'filename))
         (let ((previous (current-buffer)))
           (dired-find-file)
           (kill-buffer previous)))
        (t
         (dired-find-file-other-window))))
