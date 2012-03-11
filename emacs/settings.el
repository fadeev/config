(setq backup-directory-alist '(("." . "~/.emacs.d/backups/"))
      backup-by-copying 1
      ido-save-directory-list-file "~/.emacs.d/.ido.last"
      ido-enable-flex-matching 1
      auto-save-default nil
      org-log-done 1
      inhibit-splash-screen 1
      show-paren-delay 0
      ls-lisp-dirs-first t
      ls-lisp-use-insert-directory-program nil
      ls-lisp-verbosity nil)

(setq-default indent-tabs-mode nil)

(push '("\\.info$" . Info-on-current-buffer) auto-mode-alist)

(menu-bar-mode 0)
(ido-mode 1)
(show-paren-mode 1)

(if (functionp 'window-system)
    (cond ((window-system) (tool-bar-mode 0) (scroll-bar-mode 0))))

;; By default M-; is comment-dwim. For some reason, I dislike comment-dwim.
(global-set-key (kbd "M-;") 'comment-or-uncomment-region)

(gsk-pairs-insert-macro
 '(("("  . ")")
   ("["  . "]")
   ("{"  . "}")
   ("<"  . ">")
   ("\"" . "\"")))

(gsk-key-function-macro
 '(("\^M" . newline-and-indent)
   ("!"   . insert-hash-bang)))

(define-minor-mode key-bindings-minor-mode
  "Key bindings active in all modes. May overwrite existing ones." t ""
  `(("\M-k"     . kill-line-backward)
    ("\M-v"     . scroll-backward-screen-center)
    ("\M-p"     . scroll-backward-line)
    ("\M-n"     . scroll-forward-line)
    ("\M-D"     . backward-kill-word)
    ("\C-c\C-c" . kill-buffer-current)
    ("\C-c\C-e" . executable-interpret)
    ("\C-x\C-x" . next-multiframe-window)
    ("\C-xk"    . ido-kill-buffers-clean)
    ("\C-v"     . scroll-forward-screen-center)))

(define-minor-mode automatically-save-mode
  :init-value nil :lighter " Auto-Save" :keymap nil
  (add-to-list 'after-change-functions
               '(lambda (x y z)
                  (interactive)
                  (cond ((symbol-value 'automatically-save-mode)
                         (basic-save-buffer) (message nil))))))
