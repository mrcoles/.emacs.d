(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

;; make jsx content in .js files indent properly
(setq web-mode-content-types-alist
  '(("jsx" . "\\.js[x]?\\'")))

(add-to-list 'web-mode-comment-formats '("javascript" . "//"))
(add-to-list 'web-mode-comment-formats '("jsx" . "//"))

(setq web-mode-markup-indent-offset 2)
;; (setq web-mode-script-padding 1)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)


(provide 'setup-web-mode)
