;; Common global settings
(setq avy-char "C-:")
(setq potential-packages '(focus helm evil-collection))
(setq gui-theme 'monokai)
(setq tui-theme 'spolsky)
(setq lpt-use-evil-mode t)
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
    :straight t))

;; Convenience Packages
(use-package rainbow-delimiters :straight t)

(use-package avy :straight t)

(use-package magit :straight t)

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
