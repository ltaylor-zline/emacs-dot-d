;; Load GUI theme
(load-theme gui-theme t)

;; Set better frame title
(setq frame-title-format "LPTmacs - %b")

;; Default modeline to doomline
(require 'spaceline-config)
(spaceline-emacs-theme)

;; Uncomment for moodline
;; (mood-line-mode 1)

;; Needs to be wrapped in frame creation hook
(add-hook 'after-make-frame-functions
	  (lambda (frame)
	    (select-frame frame)
	    (set-frame-parameter (selected-frame) 'alpha 90)))

;; Use all-the-icons only in GUI mode
(when
    lpt-use-emacs-dashboard
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t))
