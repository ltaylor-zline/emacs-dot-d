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
(tool-bar-mode 0)

(use-package evil
  :straight t)
(evil-mode 1)

(use-package epkg
  :straight t)

(use-package rainbow-delimiters :straight t)

(use-package avy
  :straight t)
(global-set-key (kbd "C-:") 'avy-goto-char)

(use-package sublime-themes
  :straight t)
(load-theme 'spolsky t)

;; (use-package darkokai-theme
;;   :straight t)
;; (use-package the-matrix-theme
;;   :staight t)
;; (use-package material-theme
;;   :staight t)

(show-paren-mode 1)
(setq show-paren-style 'parenthesis)
(setq exwm-workspace-number 4)

(when window-system
  (tool-bar-mode 0))

(use-package exwm :straight t)
(require 'exwm)
(require 'exwm-config)
(exwm-config-example)

(load-file "~/.emacs.d/font.el")
