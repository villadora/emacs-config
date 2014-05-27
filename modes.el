;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Mode Config File
;;
;; Date: 2010-10-28
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Perforce
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load perforce support
;;(load-library "p4")
;;(p4-set-client-name "weig_unix")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Git
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'git)
(require 'git-blame)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tabbar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'tabbar)
;; (tabbar-mode)
;; (setq-default cursor-type 'bar)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Outline Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(outline-minor-mode 0)

;; Outline-minor-mode key map
(define-prefix-command 'cm-map nil "Outline-")

;; HIDE
(define-key cm-map "q" 'hide-sublevels)    ; Hide everything but the top-level headings
(define-key cm-map "t" 'hide-body)         ; Hide everything but headings (all body lines)
(define-key cm-map "o" 'hide-other)        ; Hide other branches
(define-key cm-map "c" 'hide-entry)        ; Hide this entry's body
(define-key cm-map "l" 'hide-leaves)       ; Hide body lines in this entry and sub-entries
(define-key cm-map "d" 'hide-subtree)      ; Hide everything in this entry and sub-entries

;; SHOW
(define-key cm-map "a" 'show-all)          ; Show (expand) everything
(define-key cm-map "e" 'show-entry)        ; Show this heading's body
(define-key cm-map "i" 'show-children)     ; Show this heading's immediate child sub-headings
(define-key cm-map "k" 'show-branches)     ; Show all sub-headings under this heading
(define-key cm-map "s" 'show-subtree)      ; Show (expand) everything in this heading & below

;; MOVE
(define-key cm-map "u" 'outline-up-heading)                ; Up
(define-key cm-map "n" 'outline-next-visible-heading)      ; Next
(define-key cm-map "p" 'outline-previous-visible-heading)  ; Previous
(define-key cm-map "f" 'outline-forward-same-level)        ; Forward - same level
(define-key cm-map "b" 'outline-backward-same-level)       ; Backward - same level
(global-set-key "\M-o" cm-map)


;;(add-hook 'outline-minor-mode-hook
;;	  (lambda ()
;;	     (
;; HIDE
;;	      (define-key outline-minor-mode-map "\M-oq" 'hide-sublevels)    ; Hide everything but the top-level headings
;;	      (define-key outline-minor-mode-map (kbd "M-o t") 'hide-body)         ; Hide everything but headings (all body lines)
;;	      (define-key outline-minor-mode-map (kbd "M-o o") 'hide-other)        ; Hide other branches
;;	      (define-key outline-minor-mode-map (kbd "M-o c") 'hide-entry)        ; Hide this entry's body
;;	      (define-key outline-minor-mode-map (kbd "M-o l") 'hide-leaves)       ; Hide body lines in this entry and sub-entries
;;	      (define-key outline-minor-mode-map (kbd "M-o d") 'hide-subtree)      ; Hide everything in this entry and sub-entries
;; SHOW
;;	      (define-key outline-minor-mode-map (kbd "M-o a") 'show-all)          ; Show (expand) everything
;;	      (define-key outline-minor-mode-map (kbd "M-o e") 'show-entry)        ; Show this heading's body
;;	      (define-key outline-minor-mode-map (kbd "M-o i") 'show-children)     ; Show this heading's immediate child sub-headings
;;	      (define-key outline-minor-mode-map (kbd "M-o k") 'show-branches)     ; Show all sub-headings under this heading
                                        ;	      (define-key outline-minor-mode-map (kbd "M-o s") 'show-subtree)      ; Show (expand) everything in this heading & below
;; MOVE
;;	      (define-key outline-minor-mode-map (kbd "M-o u") 'outline-up-heading)                ; Up
;;	      (define-key outline-minor-mode-map (kbd "M-o n") 'outline-next-visible-heading)      ; Next
;;	      (define-key outline-minor-mode-map (kbd "M-o p") 'outline-previous-visible-heading)  ; Previous
;;	      (define-key outline-minor-mode-map (kbd "M-o f") 'outline-forward-same-level)        ; Forward - same level
;;	      (define-key outline-minor-mode-map (kbd "M-o b") 'outline-backward-same-level)       ; Backward - same level
;;)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CEDET -- Collection of Emacs Development Environment Tools
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(add-to-list 'load-path (expand-file-name "~/.custom/emacs.conf/cedet-1.0pre7/common"))
;;(load-file (expand-file-name "~/.custom/emacs.conf/cedet-1.0pre7/common/cedet.el"))

;; CEDET
(require 'cedet)

;; Project Management
(global-ede-mode t)

;;-----------------------------------------
;; Semantic (exten)
;;-----------------------------------------

;;(load-file  (expand-file-name "~/.emacs.d/cedet.el"))
;; set semantic-mode

(custom-set-variables
 '(semantic-default-submodes 
   (quote 
    (global-semantic-decoration-mode global-semantic-idle-completions-mode global-semantic-idle-scheduler-mode global-semanticdb-minor-mode global-semantic-idle-summary-mode global-semantic-mru-bookmark-mode)))
 '(semantic-idle-scheduler-idle-time 3))

(semantic-mode)


;; semantic/ia

(require 'semantic/ia)

;;;; Include settings
(require 'semantic/bovine/gcc)
(require 'semantic/bovine/c)





;; Tell cedet where to find include headers
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public")
  ;;	"/ms/dist/mstk/PROJ/msparts/5.0/include")
  ;;  (list "." ".." "/ms/dev/OR/etsProduct/4.0/src" "/ms/dist/mstk/PROJ/msparts/4.0/include")
  )

;;(require 'semantic-c nil 'noerror)
(let ((include-dirs cedet-user-include-dirs))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))


;; semanticdb
(setq semanticdb-default-save-directory 
      (expand-file-name "~/.emacs.d/semanticdb"))

;; key settings for cedet
(defun my-cedet-hook ()
  ;;  (local-set-key (kbd "M-n") 'semantic-ia-complete-symbol)
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)

  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cb" 'semantic-mrub-switch-tags)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "\C-cr" 'semantic-symref)
  
  (local-set-key "\C-c\-" 'senator-fold-tag)
  (local-set-key "\C-c\+" 'senator-unfold-tag)
  (local-set-key [f9] 'senator-toggle-intangible)
  (local-set-key [f10] 'semantic-analyze-proto-impl-toggle)
  (local-set-key [f11] 'semantic-ia-fast-jump)
  (local-set-key [f12]
		 (lambda ()
		   (interactive)
		   (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
		       (error "Semantic Bookmark ring is currently empty"))
		   (let* ((ring (oref semantic-mru-bookmark-ring ring))
			  (alist (semantic-mrub-ring-to-assoc-list ring))
			  (first (cdr (car alist))))
		     (if (semantic-equivalent-tag-p (oref first tag)
						    (semantic-current-tag))
			 (setq first (cdr (car (cdr alist)))))
		     (semantic-mrub-switch-tags first)))))

(add-hook 'c-mode-hook 'my-cedet-hook)
(add-hook 'c++-mode-hook 'my-cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'my-cedet-hook)

(defun my-cedet-h-cpp-sw-self-in-hook ()
  ;; (local-set-key "." 'semantic-complete-self-insert)
  ;; (local-set-key ">" 'semantic-complete-self-insert)
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp))

(add-hook 'c-mode-hook 'my-cedet-h-cpp-sw-self-in-hook)
(add-hook 'c++-mode-hook 'my-cedet-h-cpp-sw-self-in-hook)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Yasnippet Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/yasnippet"))

(require 'yasnippet)


;;(yas-reload-all)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
        "~/.emacs.d/vendor/yasnippet/snippets"
        ))

(yas-global-mode t)

(setq ac-source-yasnippet nil)
;;(yas/set-ac-modes)
;;(yas/enable-emacs-lisp-paren-hack)



;;(yas/global-mode 1)
;;(yas/minor-mode-on)


;;(setq yas-snippet-dirs
;;      '("~/.emacs.d/snippets"            ;; personal snippets
;;        "/path/to/some/collection/"      ;; just some foo-mode snippets
;;        "/path/to/some/othercollection/" ;; some more foo-mode and a complete baz-mode
;;        "/path/to/yasnippet/snippets"    ;; the default collection
;;        ))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C/C++ Mode Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++ mode
(message "loading c++ mode")
(defvar first-time t
  "Flag signifying this is the first time that .emacs has been evaled")

(if first-time
    (setq auto-mode-alist
          (append '(
                    ("\\.cpp\\'" . c++-mode)
                    ("\\.hpp\\'" . c++-mode)
                    ("\\.lsp$" . lisp-mode)
                    ("\\.scm$" . scheme-mode)
                    ) auto-mode-alist)))

;; C++ and C mode hook
(defun my-c++-mode-hook ()
  (setq tab-width 4)
  (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key c++-mode-map "\C-ce" 'c-comment-edit)
  (setq c++-auto-hungry-initial-state t)
  ;; (setq c++-delete-function 'backward-delete-char)
  ;; (setq c++-tab-always-indent t)
  (setq indent-tabs-mode nil)
  (setq c-indent-level 4)
  (setq c-continued-statement-offset 4)
  (setq c++-empty-arglist-indent 4))
(setq c-brace-offset 0)

(defun my-c-mode-hook ()
  (setq tab-width 4)
  (define-key c-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key c-mode-map "\C-ce" 'c-comment-edit)
  (setq c-auto-hungry-initial-state 'none)
  (setq c-delete-function 'backward-delete-char)
  (setq c-tab-always-indent t)
  ;; BSD-ish indentation style
  (setq c-indent-level 4)
  (setq c-continued-statement-offset 4)
  (setq c-brace-offset 0)
  (setq c-argdecl-indent 0)
  (setq c-label-offset -4))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c-mode-hook 'my-c-mode-hook)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ruby mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "loading ruby-mode")

;;(add-to-list 'load-path (expand-file-name "/ms/dist/ruby/misc"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/ruby-electric"))

(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("^Rakefile\\'" . ruby-mode))

(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
	  '(lambda ()
             (inf-ruby-keys)
             (font-lock-mode)
             (flyspell-prog-mode)
             ))

(setq ruby-indent-level 4)

;;(require 'ruby-electric)
;;(add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode t)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Perl Mode Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use cperl-mode instead of perl-mode
(message "loading perl-mode")
(add-to-list 'auto-mode-alist '("\\.\\(pl\\|pm\\|PM\\)\\'" . cperl-mode))

;; Perl mode hook
(defun my-perl-mode-hook ()
  (setq tab-width 4)
  (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (setq perl-indent-level 4)
  (setq perl-continued-statement-offset 4))
(add-hook 'perl-mode-hook 'my-perl-mode-hook)


;; cperl outline-regexp
(setq my-cperl-outline-regexp
      (concat
       "^"                              ; Start of line
       "[ \\t]*"                        ; Skip leading whitespace
       "\\("                            ; begin capture group \1
       (mapconcat 'identity '(
                              "=head[12]"                  ; POD header
                              "package"                    ; package
                              "=item"                      ; POD item
                              "sub"                        ; subroutine definition
                              ) "\\|")
       "\\)"                            ; end capture group \1
       "\\b"                            ; Word boundary
       ))

;; cperl outline-regexp contains control-flow key words
(setq my-cperl-outline-hairy-regexp
      (concat
       "^"                              ; Start of line
       "[ \\t]*"                        ; Skip leading whitespace
       "\\("                            ; begin capture group \1
       (mapconcat 'identity '(
                              "=head[12]"                  ;     POD header
                              "package"                    ;     package
                              "=item"                      ;     POD item
                              "sub"                        ;     subroutine definition
                              "if" "else" "unless" "while" "until" "return"
                              ) "\\|")
       "\\)"                            ; end capture group \1
       "\\b"                            ; Word boundary
       ))


;; CPerl mode hook
(setq cperl-mode-hook 'my-cperl-customizations)

(defun my-cperl-customizations ()
  "cperl-mode customizations that must be done after cperl-mode loads"
  (outline-minor-mode)
  (abbrev-mode)
  (defun cperl-outline-level ()
    (looking-at outline-regexp)
    (let ((match (match-string 1)))
      (cond
       ((eq match "=head1" ) 1)
       ((eq match "package") 2)
       ((eq match "=head2" ) 3)
       ((eq match "=item"  ) 4)
       ((eq match "sub"    ) 5)
       (t 7)
       )))
  (setq cperl-outline-regexp  my-cperl-outline-regexp)
  (setq outline-regexp        cperl-outline-regexp)
  (setq outline-level        'cperl-outline-level)
  )





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python Mode & Rope Uode Settings 
;; ( Not available in the firm )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(message "load python mode")
;;(add-to-list 'load-path "/ms/dev/python/Pymacs/0.23/src/Pymacs-0.23/")
;;(require 'pymacs)
;;(setq pymacs-load-path '("/ms/dev/python/rope/0.9.2/src/rope-0.9.2/rope"
;;          "/ms/dev/python/ropemacs/20100402/install/common/lib/ropemacs-0.6-py2.5.egg"
;;          "/ms/dev/python/ropemode/20100402/install/common/lib/ropemode-0.1_rc2-py2.5.egg"))
;;(pymacs-load "ropemacs" "rope-")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Scheme Mode Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Scheme mode hooks
(defun my-scheme-mode-hook ()
  (define-key scheme-mode-map "\C-m" 'reindent-then-newline-and-indent))
(add-hook 'scheme-mode-hook 'my-scheme-mode-hook)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs-Lisp Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs-Lisp mode hooks
(defun my-lisp-mode-hook ()
  (define-key lisp-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key lisp-mode-map "\C-i" 'lisp-indent-line)
  (define-key lisp-mode-map "\C-j" 'eval-print-last-sexp))
(add-hook 'emacs-lisp-mode-hook 'my-lisp-mode-hook)
(add-hook 'lisp-mode-hook 'my-lisp-mode-hook)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Javascript Mode Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "loading js2-mode")
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
;;    (autoload 'javascript-mode "javascript" nil t)
(autoload 'espresso-mode "espresso")

(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/js2-mode"))

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(defun my-js2-mode-hook ()
  (require 'espresso)
  (setq espresso-indent-level 2
        indent-tabs-mode nil
        c-basic-offset 4)
  (c-toggle-auto-state 0)
  (c-toggle-hungry-state 1)
  (set (make-local-variable 'indent-line-function) 'my-js2-indent-function)
  (define-key js2-mode-map [(meta control |)] 'cperl-lineup)
  (define-key js2-mode-map [(meta control \;)] 
    '(lambda()
       (interactive)
       (insert "/* -----[ ")
       (save-excursion
         (insert " ]----- */"))
       ))
  (define-key js2-mode-map [(return)] 'newline-and-indent)
  (define-key js2-mode-map [(backspace)] 'c-electric-backspace)
  (define-key js2-mode-map [(control d)] 'c-electric-delete-forward)
  (define-key js2-mode-map [(control meta q)] 'my-indent-sexp)
  (if (featurep 'js2-highlight-vars)
      (js2-highlight-vars-mode))
  (message "js2-mode"))

;; add js2 hook
(add-hook 'js2-mode-hook 'my-js2-mode-hook)


;; M-C-q to indent following block
(defun my-indent-sexp ()
  (interactive)
  (save-restriction
    (save-excursion
      (widen)
      (let* ((inhibit-point-motion-hooks t)
             (parse-status (syntax-ppss (point)))
             (beg (nth 1 parse-status))
             (end-marker (make-marker))
             (end (progn (goto-char beg) (forward-list) (point)))
             (ovl (make-overlay beg end)))
        (set-marker end-marker end)
        (overlay-put ovl 'face 'highlight)
        (goto-char beg)
        (while (< (point) (marker-position end-marker))
          ;; don't reindent blank lines so we don't set the "buffer
          ;; modified" property for nothing
          (beginning-of-line)
          (unless (looking-at "\\s-*$")
            (indent-according-to-mode))
          (forward-line))
        (run-with-timer 0.5 nil '(lambda(ovl)
                                   (delete-overlay ovl)) ovl)))))

;; fix js2-indent
(defun my-js2-indent-function ()
  (interactive)
  (save-restriction
    (widen)
    (let* ((inhibit-point-motion-hooks t)
           (parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (espresso--proper-indentation parse-status))
           node)

      (save-excursion
        ;; I like to indent case and labels to half of the tab width
        (back-to-indentation)
        (if (looking-at "case\\s-")
            (setq indentation (+ indentation (/ espresso-indent-level 2))))
        ;; consecutive declarations in a var statement are nice if
        ;; properly aligned, (I love this much)i.e:
        ;;
        ;; var foo = "bar",
        ;;     bar = "foo";
        (setq node (js2-node-at-point))
        (when (and node
                   (= js2-NAME (js2-node-type node))
                   (= js2-VAR (js2-node-type (js2-node-parent node))))
          (setq indentation (+ 2 indentation))))
      
      (indent-line-to indentation)
      (when (> offset 0) (forward-char offset)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Mode Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The following lines are always needed.  Choose your own keys.
(message "loading org-mode")
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Nxml Mode 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "loading nxml-mode")
;;(add-to-list 'load-path (expand-file-name "~/.custom/emacs.conf/nxml-mode"))

;; Make sure nxml-mode can autoload
;;(load "~/.custom/emacs.conf/nxml-mode/rng-auto.el")

;; Load nxml-mode for files ending in .xml, .xsl, .rng, .xhtml
(add-to-list 'auto-mode-alist '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode))
;;(message rng-schema-locating-files)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Html Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(message "loading html-mode")
"""(defun my-html-mode-hook ()
  (setq tab-width 4)
  (setq indent-tabs-mode t)"""
;;  (define-key html-mode-map (kbd "<tab>") 'my-insert-tab)
;;  (define-key html-mode-map (kbd "C->") 'sgml-close-tag))

;;(defun my-insert-tab (&optional arg)
;;  (interactive "P")
;;  (insert-tab arg))

;;(add-hook 'html-mode-hook 'my-html-mode-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TWiki Editor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(require 'erin)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Actionscript Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "loading actionscript-mode")
(load-file  (expand-file-name "~/.emacs.d/actionscript-mode-connors.el"))
(add-to-list 'auto-mode-alist '("\\.\\(as\\|mxml\\)\\'" . actionscript-mode))
;;(require 'actionscript-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; YAML Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "loading yaml-mode")
(require 'yaml-mode)

(add-hook 'yaml-mode-hook '(lambda () (define-key yaml-mode-map "\C-m" 'newline-and-indent))) 

(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Scala Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "loading scala-mode")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/scala-mode"))
(require 'scala-mode-auto)
(add-to-list 'auto-mode-alist '("\\.scala\\'" . scala-mode))

(add-hook 'scala-mode-hook
          '(lambda () 
             (yas/minor-mode-on)))


(yas/load-directory (expand-file-name "~/.emacs.d/vendor/scala-mode/contrib/yasnippet/snippets"))

;;(add-to-list 'load-path "/path/to/ensime/dist")
;;(require 'ensime)
;;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook) 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto-complete Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "loading auto-complete mode")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/auto-complete"))
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/auto-complete/dict")
(ac-config-default)


;;(defun ac-yasnippet-condidates () (with-no-warnings (apply 'append (mapcar 'ac-yasnippet-candidate-l (yas/get-snippet-tables)))))

(setq ac-use-quick-help t)

;; Show x second later
(setq ac-auto-show-menu 0.4)
(setq ac-menu-height 12)

(setq ac-fuzzy-enable t)


;; Just ignore/distinguish case
;;(setq ac-ignore-case t)
;;(setq ac-ignore-case nil)
;; Ignore case if completion target string doesn't include upper characters, default behavior
;;(setq ac-ignore-case 'smart)

;; font face setting
;;(set-face-font 'ac-candidate-face "Consolas 11")
;;(set-face-font 'ac-selection-face "Consolas 11")



;; color setting
;;(set-face-background 'ac-candidate-face "lightgray")
;;(set-face-underline 'ac-candidate-face "darkgray")
;;(set-face-background 'ac-selection-face "steelblue")cl

(setq-default ac-source '(
                          ac-source-yasnippet
                          ac-source-filename
                          ac-srouce-words-in-all-buffer
                          ac-source-functions
                          ac-source-variables
                          ac-source-symbols
                          ac-source-features
                          ac-source-abbrev
                          ac-source-words-in-same-mode-buffers
                          ac-source-dictinary))


;; add ac sources for c/c++ mode
;;(add-hook 'c++-mode-hook (lambda() (add-to-list 'ac-sources 'ac-sources-semantic)))
;;(add-hook 'c-mode-hook (lambda() (add-to-list 'ac-sources 'ac-sources-semantic)))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Haskell Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(load "~/.custom/emacs.conf/haskell-mode-2.8.0/haskell-site-file.el")

;;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SCSS Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "loading scss mode")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/scss-mode"))
(setq scss-compile-at-save nil)

(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'ac-modes 'scss-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; HAML Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "loading haml mode")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/haml-mode"))
(require 'haml-mode)
(setq haml-indent-offset 4)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto Load Markdown Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "loading markdown mode")
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)

(require 'markdown-mode)

(add-to-list 'auto-mode-alist '("\\.\\(md\\|markdown\\)\\'" . markdown-mode))
(add-to-list 'ac-modes 'markdown-mode)


;; enable flyspell to markdown mode
(defun markdown-spellmode ()
  "markdown-mode-hook"
  (flyspell-mode t))

(add-hook 'markdown-mode-hook '(lambda() (markdown-spellmode)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bison Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "loading bison mode")
(autoload 'bison-mode "bison-mode.el" "Mode for bison/yacc" t)
(add-to-list 'auto-mode-alist '("\\.y$" . bison-mode))

(autoload 'flex-mode "flex-mode")
(add-to-list 'auto-mode-alist '("\\.l$" . flex-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Know Your HTTP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "loading know-your-http")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/know-your-http"))
(require 'know-your-http-well)
;; M-x http-headers ;; content-type
;; M-x http-method ;; post
;; M-x http-relation ;; describedby
;; M-x http-status-code ;; 500
;; M-x http-status-code ;; not_found


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Jade & Stylus Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(message "loading jade mode")
;;(add-to-list 'load-path "~/.emacs.d/vendor/jade-mode")
;;(require 'sws-mode)
;;(require 'jade-mode)
;;(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
;;(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

