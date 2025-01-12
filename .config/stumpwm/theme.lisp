
(load "~/.config/stumpwm/colors.lisp")

;;; The basic colors
(set-fg-color cat-text)
(set-bg-color cat-base)


(set-border-color        cat-lavender)
(set-focus-color         cat-lavender)
(set-unfocus-color       cat-overlay2)
(set-float-focus-color   cat-lavender)
(set-float-unfocus-color cat-overlay2)

(setf *normal-border-width*       4
      *maxsize-border-width*      4
      *transient-border-width*    4
      *float-window-border*       4
      *float-window-title-height* 15
      *window-border-style*       :tight
      *window-format*             "%c")
(set-msg-border-width 4)


(setf *key-seq-color* "^2")
(setf *which-key-format* (concat *key-seq-color* "*~5a^n ~a"))

(setf *mode-line-position* :top)
(setf *mode-line-border-width* 2)
(setf *mode-line-highlight-template* "^[^R~A^]")
(setf *mode-line-background-color* cat-base)
(setf *mode-line-foreground-color* cat-lavender)
(setf *mode-line-border-color* cat-lavender)

(setf *input-window-gravity*     :center
      *message-window-padding*   30
      *message-window-y-padding* 25
      *message-window-gravity*   :center
      *message-window-input-gravity* :center)

(setq *colors*
      `(,cat-base
        ,cat-red
        ,cat-green
        ,cat-yellow
        ,cat-blue
        ,cat-lavender
        ,cat-sky
        ,cat-text
        ,cat-rosewater
        ,cat-overlay0))
(update-color-map (current-screen))

(load-module "swm-gaps")
(setf swm-gaps:*head-gaps-size*  0
      swm-gaps:*inner-gaps-size* 10
      swm-gaps:*outer-gaps-size* 15)

(when *initializing*
  (swm-gaps:toggle-gaps-on))
