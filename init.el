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

(use-package epkg
  :straight t)

(use-package evil
  :straight t)

(use-package rainbow-delimiters :straight t)

(use-package avy :straight t)

(use-package magit :straight t)

(use-package spaceline :straight t)

(setq avy-char "C-:")
(setq potential-packages '(focus helm evil-collection))
(setq gui-theme 'monokai)
(setq tui-theme 'spolsky)

(use-package sublime-themes
  :straight t)
;; (load-theme 'spolsky t)

(use-package darkokai-theme
  :straight t)
;; (load-theme 'darkokai t)

(use-package monokai-theme
  :straight t)
(load-theme gui-theme t)

;; (use-package the-matrix-theme
;;   :staight t)
;; (use-package material-theme
;;   :staight t)

(show-paren-mode 1)
(setq show-paren-style 'parenthesis)

(load-file "~/.emacs.d/keys/base.el")
(load-file "~/.emacs.d/keys/evil.el")

(when window-system
     (load-file "~/.emacs.d/ui/gui/font.el")
     (load-file "~/.emacs.d/ui/gui/gui.el"))
