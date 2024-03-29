;; https://github.com/prettier/prettier-emacs

(require 'prettier-js)


;; https://github.com/codesuki/add-node-modules-path
(require 'add-node-modules-path)


;; (add-hook 'web-mode-hook 'prettier-js-mode)
(eval-after-load 'web-mode
  '(progn
     (add-hook 'web-mode-hook #'add-node-modules-path)
     (add-hook 'web-mode-hook #'prettier-js-mode)))

;; (add-hook 'js2-mode-hook 'prettier-js-mode)
(eval-after-load 'js2-mode
  '(progn
     (add-hook 'web-mode-hook #'add-node-modules-path)
     (add-hook 'web-mode-hook #'prettier-js-mode)))


(add-hook 'markdown-mode-hook 'prettier-js-mode)


;; Old

;; (add-hook 'web-mode-hook 'prettier-js-mode)

;; (defun enable-minor-mode (my-pair)
;;   "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
;;   (if (buffer-file-name)
;;       (if (string-match (car my-pair) buffer-file-name)
;;       (funcall (cdr my-pair)))))

;; (add-hook 'web-mode-hook #'(lambda ()
;;                             (enable-minor-mode
;;                              '("\\.jsx?\\'" . prettier-js-mode))))

(provide 'setup-prettier-js)
