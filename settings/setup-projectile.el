;; Use projectile everywhere
(projectile-global-mode)

;; hack to use bash shell since projectile voms on fish
(setq shell-file-name "/bin/bash")

;; Setup keys?
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Use silver searcher in projectile
(defvar projectile-ag-command
  (concat "\\ag" ; was \\ag, but this seems to break in fish;; used unaliased version of `ag': \ag
          " -i" ; case insensitive
          " -f" ; follow symbolic links
          " -0" ; output null separated results
          " -g ''") ; get file names matching the regex ''
  "Ag command to be used by projectile to generate file cache.")

(when (executable-find "ag")
  (defun projectile-get-ext-command ()
    "Override the projectile-defined function so that `ag' is always used for
getting a list of all files in a project."
    projectile-ag-command))

(setq projectile-mode-line
         '(:eval (format " Projectile[%s]"
                        (projectile-project-name))))

(provide 'setup-projectile)
