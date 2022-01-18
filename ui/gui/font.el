(defun font-avail (font-name)
  "Checks if a font is available"
  (find-font (font-spec :name font-name)))

(defun set-font-if-exists (font-name)
  "Sets a font if it exists"
  (if (font-avail font-name)
      (set-frame-font font-name)))

;; Try to set font to UB Mono, then try Noto Sans Mono
(set-font-if-exists
 "Ubuntu Mono 18")
(set-font-if-exists
 "Noto Sans Mono")
(set-font-if-exists
 "Hack NF-18.0")

(when (featurep 'ns-win)
  (set-frame-font "-*-HackGenNerd Console-medium-normal-normal-*-18-*-*-*-m-0-iso10646-1" t t))
