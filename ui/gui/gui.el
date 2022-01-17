(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode -1)

(load-theme gui-theme t)

(setq frame-title-format "Emacs - %b")

(require 'spaceline-config)
(spaceline-emacs-theme)
;; (set-frame-parameter (selected-frame) 'alpha 90)
