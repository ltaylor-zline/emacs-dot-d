;; Load GUI theme
(load-theme gui-theme t)

;; Set better frame title
(setq frame-title-format "LPTmacs - %b")

;; Show menu bar on MacOS because it integrates with the status bar
(when (featurep 'ns-win)
  (menu-bar-mode 1))

;; Run a set of steps when creating a new frame - i.e. transparency
(defun lpt-new-frame-setup (frame)
  "Runs when a new frame opens"
  (select-frame frame)
  (when (featurep 'ns-win)
    (set-frame-width  frame 130)
    (set-frame-height frame 40))
  (when lpt-transparent-frame
    (set-frame-parameter frame 'alpha lpt-frame-alpha)))

(cond
 ((eq lpt-gui-modeline-selection 'spaceline)
  (require 'spaceline-config)
  (spaceline-emacs-theme))
 ((eq lpt-gui-modeline-selection 'moodline)
  (mood-line-mode 1)))

;; Immediately run new-frame-setup
(lpt-new-frame-setup (selected-frame))

;; Add hook for future frames
(add-hook 'after-make-frame-functions
	  (lambda (frame)
	  (lpt-new-frame-setup frame)))

;; Use all-the-icons only in GUI mode
(when
    lpt-use-emacs-dashboard
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t))
