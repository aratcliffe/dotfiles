;; -------------------------------------------------------------------------------- ;;
;; .emacs Adam Ratcliffe, May 2023
;; -------------------------------------------------------------------------------- ;;

;; Set cmd as meta
(when (and (eq system-type 'darwin) (display-graphic-p))
  (setq mac-option-modifier nil
        mac-command-modifier 'meta))

;; Show tabs using whitespace mode: http://www.emacswiki.org/emacs/WhiteSpace 
(require 'whitespace)
(setq whitespace-style '(tabs tab-mark)) ;turns on white space mode only for tabs
(global-whitespace-mode 1)

;; Allow 'y' to be used in place of 'yes'
(fset 'yes-or-no-p 'y-or-n-p)

;; Always replace tabs with spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq js-indent-level 2)

;; Always open new files in the current frame
(setq ns-pop-up-frames nil)

;; Open file when it's dragged into an emacs frame
(define-key global-map [ns-drag-file] 'ns-find-file)

;; Hide the toolbar
(if window-system
    (tool-bar-mode -1))

;; Show buffer file name
(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

;; disable the splash screen
(setq inhibit-splash-screen t)

;; remove the whole line when killing at its beginning
(setq kill-whole-line t)

;; highlight matching parentheses
(show-paren-mode 't)

;; enable syntax-highlighting globally
(global-font-lock-mode t)

;; bind goto-line to M-g
(global-set-key (kbd "M-g") 'goto-line)

;; bind View-back-to-mark to M-v M-b
(global-set-key (kbd "C-M-m") 'View-back-to-mark)

;; disable beep
(setq visible-bell t)
(defun my-dummy-ring-bell-function () nil)
(setq ring-bell-function 'my-dummy-ring-bell-function) 

;; dos2unix from Benjamin Rutt's .emacs
(defun dos2unix () (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; unix2dos from Benjamin Rutt's .emacs
(defun unix2dos () (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))
 
;; disable backup files
(setq auto-save-mode 0)
(setq make-backup-files nil)

;; Timestamp
(defun insert-timeofday ()
  "function to insert time of day at point . format: DayOfWeek, Date Month Year	24hrTime"
  (interactive)
  (let (localstring mytime)
    (setq localstring (current-time-string))
					; example:  Mon, 17 Jun 96  12:52
    (setq mytime (concat (substring localstring 8 10) ;day number
			 " "
			 (substring localstring 4 7)  ;month 
			 " "
			 (substring localstring 20 24 ) ;2-digit year
;; uncomment lines below for time
;;			 "  "
;;			 (substring localstring 11 16 ) ;24-hr time
			 ))
    (insert mytime))
  ) 

(global-set-key "\C-ct"	'insert-timeofday)
(put 'upcase-region 'disabled nil)

(put 'downcase-region 'disabled nil)
