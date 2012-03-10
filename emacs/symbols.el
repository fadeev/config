(setq mode-int
      '((ruby-mode    . ruby)
        (python-mode  . python)
        (sh-mode      . sh)
        (haskell-mode . runghc)))

(setq temp-buffers
      '("*Ido Completions*"
        "*Completions*"
        "*Help*"
        "*Apropos*"
        "*Backtrace*"
        "*Disabled Command*"
        "*Warnings*"
        "*Compile-Log*"
        "*Packages*"
        "*Shell Command Output*"
        "*EShell Command Output*"
        "*Async Shell Command*"
        "*Buffer List*"
        "*Process List*"
        "*Directory*"))

(setq text-like-modes
      '(text-mode fundamental-mode org-mode))

(setq whitespace-style
      '(face
        tabs
        trailing
        lines
        space-before-tab
        newline
        indentation
        empty
        space-after-tab
        tab-mark))
