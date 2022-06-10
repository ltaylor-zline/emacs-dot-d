;; Common global settings
(setq avy-char "C-:")
(setq potential-packages '(focus helm evil-collection))
(setq gui-theme 'monokai)
(setq tui-theme 'spolsky)
(setq lpt-use-evil-mode t)
(setq lpt-use-magit-delta t)
(setq lpt-use-emacs-dashboard t)
(setq lpt-transparent-frame t)
(setq lpt-frame-alpha 94)
(setq lpt-gui-modeline-selection 'spaceline)

;; Load our package manager
(load-file "~/.emacs.d/setup-straight.el")

(defun check-and-load
    (should-load file-list)
  "Loads files if a condition is met"
  (when should-load
    (mapc
     'load-file
     file-list)))

;; Use evil-mode
(when lpt-use-evil-mode
  (use-package evil
    :init
    (setq evil-want-keybinding nil)
    (setq evil-want-C-u-scroll t)
    :config (evil-mode 1)
    :straight t)
  (use-package evil-collection
    :after evil
    :ensure t
    :config (evil-collection-init)
    :straight t))

;; Convenience Packages
(use-package rainbow-delimiters :straight t)

(use-package avy :straight t)

(use-package magit :straight t)

(when lpt-use-magit-delta
  (use-package magit-delta
    :straight t
    :hook (magit-mode . magit-delta-mode))
  (setq magit-delta-delta-executable "/usr/local/bin/delta"))

(use-package company :straight t)

;; Modeline packages
(use-package spaceline :straight t)
(use-package mood-line :straight t)

;; Optional Dashboard
(use-package dashboard :straight t)

;; ALL Icons
(use-package all-the-icons :straight t)

;; Themes
(use-package sublime-themes :straight t)

(use-package darkokai-theme :straight t)

(use-package monokai-theme :straight t)

(use-package the-matrix-theme :straight t)

(use-package material-theme :straight t)

;; Load keybindings
(load-file "~/.emacs.d/keys/base.el")

(check-and-load
 lpt-use-evil-mode
 '("~/.emacs.d/keys/evil.el"))

;; Load UI settings
(load-file "~/.emacs.d/ui/ui.el")

;; Load GUI-specific settings
(check-and-load
 window-system
 '("~/.emacs.d/ui/gui/font.el" "~/.emacs.d/ui/gui/gui.el"))

;; Load TUI-specific settings
(check-and-load
 (not window-system)
 '("~/.emacs.d/ui/tui/tui.el"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(warning-suppress-types '((use-package) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Load programming languages packages
(load-file "~/.emacs.d/code/langs.el")
