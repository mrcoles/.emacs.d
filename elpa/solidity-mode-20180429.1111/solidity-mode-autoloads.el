;;; solidity-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "company-solidity" "company-solidity.el" (23330
;;;;;;  48159 136827 88000))
;;; Generated autoloads from company-solidity.el

(autoload 'company-solidity "company-solidity" "\
Autocompletion for solidity with company mode.

Argument COMMAND `company-backend` functions.
Optional argument ARG the completion target prefix.
Optional argument IGNORED Additional arguments are ingnored.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "solidity-mode" "solidity-mode.el" (23330 48159
;;;;;;  140610 511000))
;;; Generated autoloads from solidity-mode.el

(add-to-list 'auto-mode-alist '("\\.sol\\'" . solidity-mode))

(autoload 'solidity-mode "solidity-mode" "\
Major mode for editing solidity language buffers.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("solidity-common.el" "solidity-flycheck.el"
;;;;;;  "solidity-mode-pkg.el") (23330 48159 139829 932000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; solidity-mode-autoloads.el ends here
