;; Remove toolbar, menubar, and scroll bar
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode -1)

;; Parens editing
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;; (add-hook 'prog-mode-hook (lambda () (use-package csharp-mode)))
;; (add-hook 'prog-mode-hook (lambda () (use-package js2-mode)))

;; Stop cursor blinking
(blink-cursor-mode 0)

;; Add dashboard if applicable
(when lpt-use-emacs-dashboard
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (setq dashboard-banner-logo-title "Welcome to LPT Emacs")
  (setq dashboard-items
	'((recents  . 10)
	  ;; (projects . 10) ;; Needs projectile
	  (bookmarks . 5)))
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-center-content nil) ;; Having issues with font sizing
  (setq dashboard-set-footer nil)
  (require 'dashboard)
  (dashboard-setup-startup-hook))

;; Start with blank scratch buffer if no dashboard
(when (not lpt-use-emacs-dashboard)
  (setq
   inhibit-startup-screen t
   inhibit-splash-screen t
   inhibit-startup-message t initial-scratch-message ""))
