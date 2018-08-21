(load "~/.emacs.d/init.el")

;; put autosave file (ie #foo#) and backup file (ie foo~) in ~/.emacs.d/.
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)

;; put backup or auto save files
(custom-set-variables
 '(auto-save-file-name-transforms'((".*" "~/.emacs.d/autosaves/" t)))
 '(backup-directory-alist '((".*" ."~/.emacs.d/backups"))))

(require  'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; config package install
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; set color-theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-ld-dark)

