;; load package manager, add the Melpa package registry
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Default directory
(if (string-equal system-type "gnu/linux")
    (setq default-directory "/home/edwin/")
    (setq default-directory "C:/Users/Edwin Wenink/")
)
;; Go to notes index
(global-set-key (kbd "C-c n") (lambda() (interactive) (find-file "C:/Users/Edwin Wenink/Documents/Notes/index.md" )))

;; Default font, see https://www.emacswiki.org/emacs/ChangeFontsPermanentlyOnWindows
;;(set-face-attribute 'default nil :family "Consolas" :height 110)
(set-face-font 'default' "PragmataPro Mono Liga-11")

;; Go to notes directory
(global-set-key (kbd "C-c C-n") (lambda() (interactive) (find-file "~/Documents/Notes/index.md" )))

;; UTF-8 
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
(when (eq window-system nil)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))
  )

;; Disable toolbar, scroll bar and menu bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)

;; No startup messages
(setq inhibit-startup-message t
      initial-scratch-message ""
      ;;inhibit-startup-echo-area-message t
)

;; Instead show custom dashboard
(use-package dashboard
    :ensure t
    :diminish dashboard-mode
    :config
	(setq dashboard-startup-banner 3)
    (setq dashboard-banner-logo-title "ejw@emacs")
	(setq dashboard-set-init-info t)
	(setq dashboard-center-content t)
    ;(setq dashboard-startup-banner "C:/Users/Edwin Wenink/Pictures/Internet")
	(add-to-list 'dashboard-items '(agenda) t)
	(setq show-week-agenda-p t)
	(setq dashboard-items '((recents  . 5)
							(bookmarks . 5)
							(projects . 5)
							(agenda . 10)
							))
    (dashboard-setup-startup-hook)
	(setq dashboard-set-footer nil)
	;;(setq dashboard-footer "Dashboard is pretty cool!")
	)

;; Guide keys
(use-package which-key
	:ensure t
	:diminish which-key-mode
	:config
	(which-key-mode 1)
	(add-hook 'org-mode-hook 'which-key-mode)
	(setq which-key-allow-evil-operators t)
	which-key-show-operator-state-maps t
)


;; Doc-view
(setq doc-view-ghostscript-program "C:/Program Files/gs/gs9.27/bin/gswin64c.exe")

;; Backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; Modeline customization
(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup)
)

;; Display time in modeline
(display-time-mode 1)

;; Display word count in modeline
(use-package wc-mode
  :ensure t
  :config
  (wc-mode 1)
)

;; Shorcuts for changing font size
;; Source: https://github.com/munen/emacs.d
(defun zoom-in ()
  (interactive)
  (let ((x (+ (face-attribute 'default :height)
              10)))
    (set-face-attribute 'default nil :height x)))

(defun zoom-out ()
  (interactive)
  (let ((x (- (face-attribute 'default :height)
              10)))
    (set-face-attribute 'default nil :height x)))

(define-key global-map (kbd "C-1") 'zoom-in)
(define-key global-map (kbd "C-0") 'zoom-out)

;; Unix style: brief prompt
(fset 'yes-or-no-p 'y-or-n-p)

;; Adjust buffer when file is edited by something else
(global-auto-revert-mode t)

;; Enable winner mode, see https://www.emacswiki.org/emacs/WinnerMode
;; Toggle through old window configurations with C-c left or right.
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; PACKAGE SPECIFIC SETTINGS
;; Put some lengthy ones in specific config files later

;; Gnus
;; TODO: evil bindings in gnus

;; Ivy
(use-package ag
  :ensure t
  :config
  (add-hook 'ag-mode-hook 'toggle-truncate-lines)
  (setq ag-highlight-search t)
  (setq ag-reuse-buffers 't))
(use-package counsel
  :ensure t)
(use-package counsel-projectile
  :ensure t)
(use-package swiper
  :ensure t)
(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :bind (("M-x" . counsel-M-x)
         ("C-s" . swiper)
         ("C-x C-f" . counsel-find-file)
         ("C-M-/" . counsel-git)
         ("C-M-*" . counsel-git-grep)
         ("C-M-=" . counsel-ag))
)

;; Evil mode
(use-package evil
  :ensure t
  :defer .1 ;; don't block emacs when starting, load evil immediately after startup
  :init
  (setq evil-want-keybinding nil) ;; see https://github.com/emacs-evil/evil-collection/issues/60 
  (setq evil-want-integration t) ;; required by evil-collection
  (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-vsplit-window-right t) ;; like vim's 'splitright'
  (setq evil-split-window-below t) ;; like vim's 'splitbelow'
  (setq evil-shift-round nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)

  ;; vim-like keybindings everywhere in emacs
  (use-package evil-collection
    :after evil
    :ensure t
    :config
    (evil-collection-init))

  ;; gl and gL operators, like vim-lion(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))
  (use-package evil-lion
    :ensure t
    :bind (:map evil-normal-state-map
                ("g l " . evil-lion-left)
                ("g L " . evil-lion-right)
                :map evil-visual-state-map
                ("g l " . evil-lion-left)
                ("g L " . evil-lion-right)))

  ;; gc operator, like vim-commentary
  (use-package evil-commentary
    :ensure t
    :bind (:map evil-normal-state-map
                ("gc" . evil-commentary)))

  ;; gx operator, like vim-exchange
  ;; NOTE using cx like vim-exchange is possible but not as straightforward
  (use-package evil-exchange
    :ensure t
    :bind (:map evil-normal-state-map
                ("gx" . evil-exchange)
                ("gX" . evil-exchange-cancel)))

  ;; gr operator, like vim's ReplaceWithRegister
  (use-package evil-replace-with-register
    :ensure t
    :bind (:map evil-normal-state-map
                ("gr" . evil-replace-with-register)
                :map evil-visual-state-map
                ("gr" . evil-replace-with-register)))

  ;; * operator in visual mode
  (use-package evil-visualstar
    :ensure t
    :bind (:map evil-visual-state-map
                ("*" . evil-visualstar/begin-search-forward)
                ("#" . evil-visualstar/begin-search-backward)))

  ;; ex commands, which a vim user is likely to be familiar with
  (use-package evil-expat
    :ensure t
    :defer t)

  ;; visual hints while editing
  ;; (use-package evil-goggles
  ;;   :ensure t
  ;;   :config
  ;;   (evil-goggles-use-diff-faces)
  ;;   (evil-goggles-mode))

  ;; like vim-surround
  (use-package evil-surround
    :ensure t
    :commands
    (evil-surround-edit
     evil-Surround-edit
     evil-surround-region
     evil-Surround-region)
    :init
    (evil-define-key 'operator global-map "s" 'evil-surround-edit)
    (evil-define-key 'operator global-map "S" 'evil-Surround-edit)
    (evil-define-key 'visual global-map "S" 'evil-surround-region)
    (evil-define-key 'visual global-map "gS" 'evil-Surround-region))
)

(if (string-equal system-type "gnu/linux")
    (setq default-directory "/home/edwin/")
    (setq default-directory "C:/Users/Edwin Wenink/")
)

;; Org mode
;; See https://pages.sachachua.com/.emacs.d/Sacha.html#org898cd11
;; and https://github.com/tsacha/.emacs.d/blob/master/sacha.org#recent-files
;; For quasi quote and , notation: https://stackoverflow.com/questions/9449364/elisp-alist-and-strings-type-confusion
(use-package org
	:ensure t
	:init
	  (if (string-equal system-type "gnu/linux")
	    (setq org-directory "~/Dropbox/org/")
	    (setq org-directory "C:/Users/Edwin Wenink/Dropbox/org/"))
	  (load "~/.emacs.d/org-config/capture-templates.el")
	  (setq org-confirm-babel-evaluate nil
			org-odt-data-dir "~/.emacs.d/elisp/org-mode/etc/"
			org-odt-styles-dir "~/.emacs.d/elisp/org-mode/etc/styles/"
			org-archive-location (concat org-directory "archive.org::datetree/* Finished Tasks") 
			org-default-notes-file (concat org-directory "notes.org")
			org-refile-targets `( (,(concat org-directory "inbox.org") :maxlevel . 1)
					      (,(concat org-directory "active.org") :maxlevel . 3)
					      (,(concat org-directory "future.org") :maxlevel . 2))
			org-todo-keywords
			'((sequence  "TODO(t)" "WAITING(w)" "[ ](T)" "NEXT(n)" "|" "DONE(d)" "[x](D)" "CANCELED(c)"))
			org-todo-keyword-faces
			'(("TODO" . "DarkRed") ;; was org-warning
			  ("DONE" . "DarkGreen")
			  ("WAITING" . "DarkOrange")
			  ("CANCELED" . "DarkGreen")
			  ("DELEGATED" . "BlueViolet")
			  ("NEXT" . "#008080")
			  ("[x]" . "DarkGreen") 
			  )
			org-log-done 'time
			org-fontify-whole-heading-line t
			org-fontify-done-headline t
			org-src-fontify-natively t
			org-src-preserve-indentation t
			org-src-tab-acts-natively t
			org-src-window-setup 'current-window
			org-edit-src-content-indentation 0
			org-fontify-quote-and-verse-blocks t
	                ;;org-agenda-include-diary t
			;;org-agenda-start-with-clockreport-mode t
			org-agenda-show-holidays-birthdays t
			org-hide-leading-stars t
			org-return-follows-link t
			org-clock-clocked-in-display 'frame-title
			)

	  :bind
	  (("C-c a" . org-agenda)
	   ("C-c l" . org-store-link)
	   ("C-c c" . org-capture)
	   )
)

(setq org-modules '(org-bbdb
                      org-gnus
                      ;;org-drill
                      org-info
                      ;;org-jsinfo
                      org-habit
                      org-irc
                      org-mouse
                      org-protocol
                      ;;org-annotate-file
                      ;;org-eval
                      ;;org-expiry
                      ;;org-interactive-query
                      ;;org-man
                      ;;org-collector
                      ;;org-panel
                      ;;org-screen
                      ;;org-toc
))
(eval-after-load 'org
 '(org-load-modules-maybe t))
;; Prepare stuff for org-export-backends
(setq org-export-backends '(org latex icalendar html ascii))

;; Supercharge your agenda!
(use-package org-super-agenda
  :ensure t
  :after org
  :config
    (org-super-agenda-mode t)
    (setq org-super-agenda-header-map (make-sparse-keymap)) ;; needed to fix conflict with evil org on 'j'
    (setq org-super-agenda-groups
	   '(;; Each group has an implicit boolean OR operator between its selectors.
	     (:name "Schedule"
		    :time-grid t)  ; Items that appear on the time grid
	     (:name "Today"  ; Optionally specify section name
		    :date today
		    :scheduled today
		    :todo "TODAY")  ; Items that have this TODO keyword
	     (:habit t)
	     (:name "Due today"
		    :deadline today)
	     (:name "Overdue"
		    :deadline past)
	     (:name "Due soon"
		    :deadline future)
	     (:name "Important"
		    ;; Single arguments given alone
		    :tag "bills"
		    :priority "A")
	     (:name "Next items"
		    :time-grid t
		    :todo ("NEXT"))
	     (:name "To read"
		    :tag "read"
		    :tag "book"
		    :tag "web"
		    :tag "article")
	     (:name "Waiting"
		    :todo "WAITING")
	     (:name "Emacs"
		    :tag "emacs")
	     ;; Set order of multiple groups at once
	     ;; Groups supply their own section names when none are given
	     (:todo "WAITING" :order 8)  ; Set order of this section
	     (:todo ("SOMEDAY" "TO-READ" "CHECK" "TO-WATCH" "WATCHING")
		    ;; Show this group at the end of the agenda (since it has the
		    ;; highest number). If you specified this group last, items
		    ;; with these todo keywords that e.g. have priority A would be
		    ;; displayed in that group instead, because items are grouped
		    ;; out in the order the groups are listed.
		    :order 9)
	     (:priority<= "B"
			  ;; Show this section after "Today" and "Important", because
			  ;; their order is unspecified, defaulting to 0. Sections
			  ;; are displayed lowest-number-first.
			  :order 1)
	     ;; After the last group, the agenda will display items that didn't
	     ;; match any of these groups, with the default order position of 99

	     )
      )
)


;; Evil bindings for org mode; especially needed this for agenda view
(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)
) 

;; Org quickstart (adapted from https://github.com/munen/emacs.d)
(defun org ()
  "Open main 'org-mode' file and start 'org-agenda' for today."
  (interactive)
  (find-file (concat org-directory "inbox.org"))
  (org-agenda-list)
  (org-agenda-day-view)
  (shrink-window-if-larger-than-buffer)
  (other-window 1)
)

;; Org Timer Settings, source: https://github.com/munen/emacs.d/blob/master/org-pomodoro.el
;; Starts 25 min timer on clock in on task
;; Stop manually with M-x org-timer-stop
(load "~/.emacs.d/org-config/org-pomodoro")

;; Exit insert mode by pressing jj within given timeframe
(use-package key-chord
  :ensure t
  :after evil
  :init
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (key-chord-mode 1)
  :config
)  

;; Magit
(use-package magit
  :ensure t
  :bind
  (("C-x g" . magit-status))
)

;; Add evil bindings to magit
(use-package evil-magit
  :ensure t
)

;; Markdown editing
(use-package markdown-mode
  :ensure t
  :defer t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc")
  :config (add-hook 'markdown-mode-hook (visual-line-mode))
;; N.B. visual clean is softwrap
)

;; Latex
;; References:
;; https://piotr.is/2010/emacs-as-the-ultimate-latex-editor/
;; https://nasseralkmim.github.io/notes/2016/08/21/my-latex-environment/
(use-package tex-site
  :ensure auctex
  :mode ("\\.tex\\'" . latex-mode)
  :config
  (setq TeX-auto-save t)
  ;;(setq-default TeX-master nil)

  ;; Update PDF buffers after successful LaTeX runs
  (add-hook 'TeX-after-TeX-LaTeX-command-finished-hook
	   #'TeX-revert-document-buffer)

  ;; to use pdfview with auctex
  (add-hook 'LaTeX-mode-hook 'pdf-tools-install)

  ;; to use pdfview with auctex
  ;; (setq TeX-view-program-selection '((output-pdf "pdf-tools"))
  ;;      TeX-source-correlate-start-server t)
  ;; (setq TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view")))
)

;; managing references of e.g.  
(use-package reftex
  :ensure t
  :defer t
  :config
  (setq reftex-cite-prompt-optional-args t) ; Prompt for empty optional arguments in cite
)

;; 
(use-package ivy-bibtex
  :ensure t
  :bind ("C-c b b" . ivy-bibtex)
  :config
  (if (string-equal system-type "gnu/linux")
    (setq bibtex-completion-bibliography 
          '("/home/edwin/bib/ref.bib")) ;; TODO
    (setq bibtex-completion-bibliography 
          '("C:/Users/Edwin Wenink/Bib/Artificial Intelligence.bib"
          "C:/Users/Edwin Wenink/Bib/Philosophy.bib"))
   )
  
  ;; (setq bibtex-completion-library-path 
  ;;       '("C:/Users/Nasser/OneDrive/Bibliography/references-pdf"
  ;;         "C:/Users/Nasser/OneDrive/Bibliography/references-etc"))

  ;; using bibtex path reference to pdf file
  (setq bibtex-completion-pdf-field "File")

  ;;open pdf with external viwer foxit
  ;; (setq bibtex-completion-pdf-open-function
  ;;       (lambda (fpath)
  ;;         (call-process "C:\\Program Files (x86)\\Foxit Software\\Foxit Reader\\FoxitReader.exe" nil 0 nil fpath)))

  (setq ivy-bibtex-default-action 'bibtex-completion-insert-citation)
)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
;;(set Tex-PDF-mode t)

;; Elfeed RSS
;; see http://pragmaticemacs.com/emacs/read-your-rss-feeds-in-emacs-with-elfeed/
;; for how to filter based on org headers with custom functions

;; write to and load from disk for synchronization between systems
;; call this to open elfeed from database
(defun elfeed-load-db ()
  (interactive)
  (elfeed-db-load)
  (elfeed)
  (elfeed-search-update--force)
)

(defun elfeed-save-db ()
  (interactive)
  (elfeed-db-save)
  (quit-window)
)

;; extra global binding for loading the feed from database
(global-set-key (kbd "C-c ef") 'elfeed-load-db)

;;(set-face-font 'default' "PragmataPro Mono Liga-11")
(use-package elfeed
  :ensure t
  :config
  (add-hook 'elfeed-show-mode-hook (lambda()
				    (visual-line-mode)
				    (set-face-attribute 'variable-pitch (selected-frame) :font (font-spec :name "PragmataPro Mono Liga-11"))
					(setq fill-column 120)
					(setq elfeed-show-entry-switch #'my-show-elfeed)
				    ))

  (setq elfeed-db-directory (concat org-directory "elfeed-db"))
  :bind (:map elfeed-search-mode-map
	      ("wq" . elfeed-save-db);; the q mapping is taken by evil-collection
	      ("Q" . elfeed-save-db);; the q mapping is taken by evil-collection
	      ) 
)

(defun my-show-elfeed (buffer)
  (with-current-buffer buffer
    (setq buffer-read-only nil)
    (goto-char (point-min))
    (re-search-forward "\n\n")
    (fill-individual-paragraphs (point) (point-max))
    (setq buffer-read-only t))
  (switch-to-buffer buffer))

(use-package elfeed-goodies
  :ensure t
  :init
  (elfeed-goodies/setup)
)

;; use an org file to organise feeds
;; See https://github.com/remyhonig/elfeed-org for tips
;; N.B. Evil bindings are present in evil-collection!
(use-package elfeed-org
  :ensure t
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list (concat org-directory "elfeed.org")))
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(org-agenda-files
   (quote
    ("~/Dropbox/org/inbox.org" "~/Dropbox/org/active.org" "~/Dropbox/org/dates.org" "~/Dropbox/org/habit.org"  )))
 '(package-selected-packages
   (quote
    (org-super-agenda elfeed-goodies smart-mode-line sml latex-pretty-symbols auctex elfeed-org elfeed markdown-mode wc-mode wcMode key-chord evil-org evil-surround evil-goggles evil-expat evil-visualstar evil-replace-with-register evil-exchange evil-commentary evil-lion evil-collection evil use-package)))
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-goggles-change-face ((t (:inherit diff-removed))))
 '(evil-goggles-delete-face ((t (:inherit diff-removed))))
 '(evil-goggles-paste-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-add-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-change-face ((t (:inherit diff-changed))))
 '(evil-goggles-undo-redo-remove-face ((t (:inherit diff-removed))))
 '(evil-goggles-yank-face ((t (:inherit diff-changed)))))
