(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
      (unless (file-exists-p bootstrap-file)
	(with-current-buffer
	      (url-retrieve-synchronously
	       "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	       'silent 'inhibit-cookies)
	      (goto-char (point-max))
	      (eval-print-last-sexp)))
      (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(use-package epkg :straight t)

(use-package evil
  :straight t
  :init (evil-mode 1))

(use-package rainbow-delimiters :straight t)

(use-package sublime-themes :straight t)
;; (load-theme 'spolsky t)
(use-package monokai-theme :straight t)
(load-theme 'monokai t)

(show-paren-mode 1)
(setq show-paren-style 'parenthesis)
(setq exwm-workspace-number 4)

(when window-system
  (tool-bar-mode 0))

(set-frame-font "Hack 14")

;; EXWM
(require 'exwm)
(require 'exwm-config)
(exwm-config-example)
