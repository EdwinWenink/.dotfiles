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
							(agenda . 5)
							(registers . 5)))
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
)

;; Doc-view
(setq doc-view-ghostscript-program "C:/Program Files/gs/gs9.27/bin/gswin64c.exe")

;; Backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; Display time in modeline
(display-time-mode 1)

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
  (evil-mode)

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

  ;; * operator in vusual mode
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
  (use-package evil-goggles
    :ensure t
    :config
    (evil-goggles-use-diff-faces)
    (evil-goggles-mode))

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

;; Org mode
;; See https://pages.sachachua.com/.emacs.d/Sacha.html#org898cd11
;; and https://github.com/tsacha/.emacs.d/blob/master/sacha.org#recent-files
;; Consider using: https://github.com/edwtjo/evil-org-mode
(use-package org
	:ensure t
	:init
	  (load "~/.emacs.d/org-config/capture-templates.el")
	  (setq org-confirm-babel-evaluate nil
			org-odt-data-dir "~/.emacs.d/elisp/org-mode/etc/"
			org-odt-styles-dir "~/.emacs.d/elisp/org-mode/etc/styles/"
			org-directory "~/org/"
			org-archive-location (concat org-directory "/archive.org")
			org-default-notes-file (concat org-directory "/notes.org")
			org-todo-keywords
			'((sequence  "TODO(t)" "STARTED(s)" "[ ](T)" "NEXT(n)" "|" "DONE(d)" "[x](D)"))
			org-todo-keyword-faces
			'(("TODO" . org-warning)
			  ("DONE" . "green")
			  ("STARTED" . "orange")
			  ("CANCELED" . (:foreground "white" :background "#4d4d4d" :weight bold))
			  ("DELEGATED" . "pink")
			  ("NEXT" . "#008080")
			  ("[x]" . "green") 
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
	                org-agenda-include-diary t
			org-hide-leading-stars t
			org-return-follows-link t
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


;; Magit
(use-package magit
  :ensure t
  :bind
  (("C-x g" . magit-status)))

;; Add evil bindings to magit
(use-package evil-magit
	:ensure t
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/org/emacs.org" "~/org/habits.org" "~/org/todo.org")))
 '(package-selected-packages
   (quote
    (evil-surround evil-goggles evil-expat evil-visualstar evil-replace-with-register evil-exchange evil-commentary evil-lion evil-collection evil use-package))))
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
