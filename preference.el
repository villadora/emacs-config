;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Preference Custom Settings
;;
;; Date: 2010-10-28
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Preferences
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Global Key Settings
;;(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-x?" 'help-command)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-s" 'replace-string)
;(global-set-key [delete] 'delete-char)
(global-set-key [f7] 'compile)

;; Line number
(require 'linum)
(linum-mode t)
(define-key global-map [f6] `linum-mode)

;; highlight the matched parens
(setq show-paren-moe t)

;; highlight current line
(global-hl-line-mode nil)
;; How to specify the color?
(set-face-background 'hl-line "#222")
;;(set-face-foreground 'highlight "#111")


;; turn on font-lock mode
(global-font-lock-mode t)

;;enable visual feedback on selections
(setq-default transient-mark-mode t)

;;disable the welcome screen
(setq inhibit-startup-message t)

(setq gdb-many-windows t) 
(setq column-number-mode t)
(setq line-number-mode t)

;; Show which function I am in
(which-function-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tabbar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(require 'tabbar)
;(tabbar-mode)
;(setq-default cursor-type 'bar)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Color Theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-initialize)
;;(color-theme-deep-blue)
;;(color-theme-comidia)
(color-theme-clarity)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Change the Backup 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(make-directory "/tmp/dvilla.emacs.bk/autosaves/" t)
(make-directory "/tmp/dvilla.emacs.bk/backups/" t)
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "/tmp/dvilla.emacs.bk/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "/tmp/dvilla.emacs.bk/backups/"))))


;; create the autosave dir if necessary, since emacs won't.
;;(make-directory "~/.emacs.d/autosaves/" t)

;; (defvar user-temporary-file-directory
;;   (concat temporary-file-directory user-login-name ".emacs.tmpfile" "/"))
;; (make-directory user-temporary-file-directory t)
;; (setq backup-by-copying t)
;; (setq backup-directory-alist
;;       `(("." . ,user-temporary-file-directory)
;;         (,tramp-file-name-regexp nil)))
;; (setq auto-save-list-file-prefix
;;       (concat user-temporary-file-directory ".auto-saves-"))
;; (setq auto-save-file-name-transforms
;;       `((".*" ,user-temporary-file-directory t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Move Line/Region Up/Down
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))


(global-set-key "\M-p" 'move-text-up)
(global-set-key "\M-n" 'move-text-down)