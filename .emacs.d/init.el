(global-linum-mode 1) ; always show line numbers
(setq linum-format "%d| ")  ;set format

;; add load path
(add-to-list 'load-path "~/.emacs.d/load-path/")

;; config markdown mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; redefine go line keymap
(define-key global-map "\C-c\C-g" 'goto-line)

;; active winner mode to undo or redo change in the window
(when (fboundp 'winner-mode)
    (winner-mode 1))

;; define prev window
(defun prev-window()
  (interactive)
  (other-window -1))

(global-set-key (kbd "C-x p") 'prev-window)

(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
	(e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
     "python -mjson.tool" (current-buffer) t)))

;; insert current date time
(defun insert-current-time ()
    "Insert the current time"
    (interactive "*")
    (insert (current-time-string)))

(global-set-key "\C-xt" 'insert-current-time)

;; set yasnippet
(add-to-list 'load-path
	     "~/.emacs.d/elpa/yasnippet-20180621.50")
(require 'yasnippet)
(yas-global-mode 1)

;; set python file template
(defun autoinsert-yas-expand()
  "Replace text in yasnippet template."
  (yas-expand-snippet (buffer-string) (point-min) (point-max)))

(define-auto-insert "\\.py$" [ "~/.emacs.d/template/template.py" autoinsert-yas-expand ])

;; auto-insert-mode default in use
(auto-insert-mode)

;; 关闭auto-insert-mode的确认
(setq auto-insert-query nil)

(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
