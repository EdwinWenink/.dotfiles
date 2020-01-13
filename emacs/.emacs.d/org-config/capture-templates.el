;; Later inherit org directory from main init.el
;;(setq org-directory "C:/Users/Edwin Wenink/Dropbox/org/")
(setq org-capture-templates
      ;; Change TODO later
      '(("t" "Inbox (TODO)" entry (file+headline "C:/Users/Edwin Wenink/Dropbox/org/inbox.org" "Inbox")
         "* TODO %? %i\n  %a\n")
        ("i" "Inbox" entry (file+headline "C:/Users/Edwin Wenink/Dropbox/org/inbox.org" "Inbox")
         "* %? %i\n  %a\n")
        ("b" "Book" entry (file+headline "C:/Users/Edwin Wenink/Dropbox/org/books.org" "TO READ")
         "* %? %i\n  %a\n")
        ("j" "Journal" entry (file+datetree "C:/Users/Edwin Wenink/Dropbox/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))
