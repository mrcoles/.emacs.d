
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Set path to dependencies
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)


;; Set up appearance early
(require 'appearance)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Don't backup files, please
(setq make-backup-files nil)
(setq vc-make-backup-files nil)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; make C-k kill whole line (including line break) if at start of line
(setq kill-whole-line t)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(
     ;; ag
     ;; arduino-mode
     ;; auto-complete
     ;; cider
     ;; clojure-mode
     ;; clojure-mode-extra-font-locking
     color-theme
     ;; css-eldoc
     ;; dired-details
     ;; dired-details+
     ;; dockerfile-mode
     ;; elisp-slime-nav
     elpy
     ;; exec-path-from-shell
     ;; f
     ;; fill-column-indicator
     ;; fiplr ;; deprecated!!!!
     flx
     flx-ido
     ;; flycheck
     ;; flycheck-pos-tip
     ;; gist
     ;; gitconfig-mode
     ;; gitignore-mode
     ;; groovy-mode
     guide-key
     ;; highlight-escape-sequences
     ;; htmlize
     ;; hydra
     ;; ido-at-point
     ;; ido-vertical-mode
     ;; inflections
     js2-mode
     ;; js2-refactor
     ;; jsx-mode
     ;; keyfreq
     less-css-mode
     magit
     ;; magit-tramp
     ;; malabar-mode
     markdown-mode
     ;; maxframe
     ;; move-text
     nodejs-repl
     ;; package-utils
     ;; paredit
     ;; php-mode
     ;; prodigy
     projectile
     ;; quickrun
     ;; restclient
     ;; reveal-in-finder
     ;; scala-mode2
     ;; simple-httpd
     ;; slime-js
     ;; smartparens
     swift3-mode
     ;; smartparens
     solidity-mode
     ;; speed-type
     ;; string-edit
     ;; visual-regexp
     ;; visual-regexp-steroids
     web-mode
     ;; whitespace-cleanup-mode
     yaml-mode
     ;; yasnippet
     ;; yesql-ghosts
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Lets start with a smattering of sanity
(require 'sane-defaults)

;; Setup environment variables from the user's shell.
(when is-mac
  (require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

;; Setup extensions


;; TODO (eval-after-load 'ido '(require 'setup-ido))
;; (eval-after-load 'org '(require 'setup-org))
;; (eval-after-load 'dired '(require 'setup-dired))
;; (eval-after-load 'magit '(require 'setup-magit))
;; (eval-after-load 'grep '(require 'setup-rgrep))
;; (eval-after-load 'shell '(require 'setup-shell))
;; (require 'setup-hippie)
;; ;; TODO - (require 'setup-perspective)
;; (require 'setup-ffip)
;; (require 'setup-html-mode)
;; (require 'setup-paredit)
(require 'setup-projectile)
;; (require 'setup-python)
;; (require 'setup-js-beautify)
;; (require 'setup-nodejs)
;; ;; TODO - (require 'setup-scala)
(require 'setup-web-mode)
(require 'setup-prettier-js)


;; Font lock dash.el
(eval-after-load "dash" '(dash-enable-font-lock))

;; ;; Default setup of smartparens
;; (require 'smartparens-config)
;; (setq sp-autoescape-string-quote nil)
;; (--each '(css-mode-hook
;;           restclient-mode-hook
;;           js-mode-hook
;;           java-mode
;;           ruby-mode
;;           markdown-mode
;;           groovy-mode
;;           scala-mode)
;;   (add-hook it 'turn-on-smartparens-mode))

;; ;; Language specific setup files
;; (eval-after-load 'js2-mode '(require 'setup-js2-mode))
;; (eval-after-load 'ruby-mode '(require 'setup-ruby-mode))
;; (eval-after-load 'clojure-mode '(require 'setup-clojure-mode))
;; (eval-after-load 'markdown-mode '(require 'setup-markdown-mode))

;; ;; Load stuff on demand
;; (autoload 'skewer-start "setup-skewer" nil t)
;; (autoload 'skewer-demo "setup-skewer" nil t)
;; (autoload 'auto-complete-mode "auto-complete" nil t)
;; (eval-after-load 'flycheck '(require 'setup-flycheck))

;; Map files to modes
(require 'mode-mappings)

;; ;; Highlight escape sequences
;; (require 'highlight-escape-sequences)
;; (hes-mode)
;; (put 'font-lock-regexp-grouping-backslash 'face-alias 'font-lock-builtin-face)

;; ;; Visual regexp
;; (require 'visual-regexp)
;; (require 'visual-regexp-steroids)

;; TODO - ;; Functions (load all files in defuns-dir)
;; TODO - (setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
;; TODO - (dolist (file (directory-files defuns-dir t "\\w+"))
;; TODO -   (when (file-regular-p file)
;; TODO -     (load file)))

;; TODO - (require 'expand-region)
;; TODO - (require 'multiple-cursors)
;; (require 'delsel)
;; TODO - (require 'jump-char)
;; TODO - (require 'eproject)
;; TODO - (require 'wgrep)
;; TODO - (require 'change-inner)
;; TODO _ (require 'multifiles)

;; TODO - ;; Don't use expand-region fast keys
;; TODO - (setq expand-region-fast-keys-enabled nil)

;; TODO - ;; Show expand-region command used
;; TODO - (setq er--show-expansion-message t)

;; TODO - ;; Fill column indicator
;; TODO - (require 'fill-column-indicator)
;; TODO - (setq fci-rule-color "#111122")

;; TODO - ;; Browse kill ring
;; TODO - (require 'browse-kill-ring)
;; TODO - (setq browse-kill-ring-quit-action 'save-and-restore)

;; TODO - ;; Smart M-x is smart
;; TODO - (require 'smex)
;; TODO - (smex-initialize)

;; TODO - ;; Setup key bindings
;; TODO - (require 'key-bindings)

;; Misc
;; TODO - (require 'project-archetypes)
;; TODO - (require 'my-misc)
;; TODO - (when is-mac (require 'mac))

;; TODO - ;; Elisp go-to-definition with M-. and back again with M-,
;; TODO - (autoload 'elisp-slime-nav-mode "elisp-slime-nav")
;; TODO - (add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t) (eldoc-mode 1)))

;; TODO - ;; Emacs server
;; TODO - (require 'server)
;; TODO - (unless (server-running-p)
;; TODO -   (server-start))

;; TODO - ;; Edit with Emacs
;; TODO - (require 'edit-server)
;; TODO - (edit-server-start)

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; TODO - ;; Conclude init by setting up specifics for the current user
;; TODO - (when (file-exists-p user-settings-dir)
;; TODO -   (mapc 'load (directory-files user-settings-dir nil "^[^#].*el$")))
;; TODO - (put 'ido-exit-minibuffer 'disabled nil)


;; Recompile files on exit
(setq config-dir (file-name-directory (or (buffer-file-name) load-file-name)))
(defun byte-compile-dotfiles ()
  "Byte compile all Emacs dotfiles."
  (interactive)
  ;; Automatically recompile the entire .emacs.d directory.
  (byte-recompile-directory (expand-file-name config-dir) 0))
(defun byte-compile-user-init-file ()
  (let ((byte-compile-warnings '(unresolved)))
    ;; in case compilation fails, don't leave the old .elc around:
    (when (file-exists-p (concat user-init-file ".elc"))
      (delete-file (concat user-init-file ".elc")))
    (byte-compile-file user-init-file)
    (byte-compile-dotfiles)
    ;; (message "%s compiled" user-init-file)
    ))
(add-hook 'kill-emacs-hook 'byte-compile-user-init-file t t)
