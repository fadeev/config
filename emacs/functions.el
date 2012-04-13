(defalias 'shell-command 'eshell-command)
(defalias 'yes-or-no-p 'y-or-n-p)

(defun insert-hash-bang ()
  (interactive)
  (self-insert-command 1)
  (if (and (eq 35 (char-before 2)) (eq (line-number-at-pos) 1))
      (insert "/usr/bin/env " (symbol-name (cdr (assoc major-mode mode-int))))))

(defun truncate-lines-unless-text-mode ()
  (interactive)
  (unless (memq major-mode text-like-modes)
    (setq truncate-lines t)))

(defun kill-buffer-current ()
  (interactive)
  (let ((visible-buffers (ido-get-buffers-in-frames)))
    (kill-buffer (current-buffer))
    (if (memq (buffer-name (current-buffer)) visible-buffers)
        (delete-window))))

(defun kill-line-backward ()
  (interactive)
  (kill-line 0))

(defun scroll-backward-screen-center ()
  (interactive)
  (scroll-down)
  (move-to-window-line nil)
  (beginning-of-line))

(defun scroll-forward-screen-center ()
  (interactive)
  (scroll-up)
  (move-to-window-line nil)
  (beginning-of-line))

(defun scroll-backward-line ()
  (interactive)
  (scroll-down 1))

(defun scroll-forward-line ()
  (interactive)
  (scroll-up 1))

(defun expansion-word ()
  "If ∃ command [major mode]-expansion-[current word], e.g. html-expansion-img,
kill current word and run the command. Otherwise, indent according to mode."
  (interactive)
  (flet ((i (&rest string)
            (mapc '(lambda (s)
                    (let ((start (point)))
                       (cond ((stringp s) (insert s))
                             ((sequencep s) (insert (eval s))))
                       (indent-region start (point))))
                  string)))
    (let ((m (replace-regexp-in-string "-mode$" "" (symbol-name major-mode))))
      (let ((e (intern (concat m "-expansion-" (current-word 1)))))
        (cond ((boundp e)
               (backward-kill-word 1)
               (mapc 'i (reverse (cdr (memq 'point (reverse (symbol-value e))))))
               (save-excursion
                 (mapc 'i (cdr (memq 'point (symbol-value e))))))
              (t
               (indent-for-tab-command)))))))

(defun ls-lisp-format (file-name file-attr &optional file-size switches time-index now)
  "Redefines a function, which is used to output directory listings in dired.
This makes it less verbose."
  (concat (if (car file-attr) "d " "f ")
          (propertize file-name 'dired-filename t)
          (if (stringp (nth 0 file-attr))
              (concat " -> " (nth 0 file-attr))
            "\n")))
