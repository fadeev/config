(defalias 'shell-command 'eshell-command)
(defalias 'yes-or-no-p 'y-or-n-p)

(defun insaft (&rest string)
  "Inserts STRING after point."
  (let ((start (point)))
    (mapc 'insert string)
    (goto-char start)))

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

(defun ido-kill-buffers-clean ()
  (interactive)
  (mapc '(lambda (b) (and (get-buffer b) (kill-buffer b))) temp-buffers)
  (let ((visible-buffers (ido-get-buffers-in-frames)))
    (ido-kill-buffer)))

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

(defun expand-word ()
  "If ∃ a command [major mode]-expand-[current word] (e.g. html-expand-img),
kill current word and run the command. Otherwise, indent according to mode."
  (interactive)
  (let ((mode
         (mapconcat 'identity
                    (butlast (split-string (symbol-name major-mode) "-")) "-")))
    (let ((func (intern (concat mode "-expand-" (current-word 1)))))
      (cond ((commandp func) (backward-kill-word 1) (call-interactively func))
            (t (indent-according-to-mode))))))
