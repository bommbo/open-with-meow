# open-with-meow
It's a plugin for open file with emacs.

## issue
 Neovim cannot open files that have been opened before.If you do, please kill kill other buffer.
 
## emacs config
need: kitty
```
(defun my/open-current-file-in-nvim ()
  "open current file with neovim."
  (interactive)
  (let ((line-number (+ (if (bolp) 1 0) (count-lines 1 (point))))
(column-number (+ (or (current-column) 0) 1)))
    (start-process-shell-command
     "open-in-nvim" nil
      (format "kitty -e nvim -c \"call cursor(%d, %d)\" %s"
line-number column-number (shell-quote-argument buffer-file-name)))))
```
