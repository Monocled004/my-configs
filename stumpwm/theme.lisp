
;;; Loading colors
(load "~/.config/stumpwm/colors.lisp")


(set-border-color        "#4CB9E7")
(set-focus-color         "#97fff4")
(set-unfocus-color       "#161616")
(set-float-focus-color   "#97fff4")
(set-float-unfocus-color "#161616")


(set-fg-color "#4CB9E7")
(set-bg-color "#101010")

(setf *normal-border-width*       2
      *maxsize-border-width*      2
      *transient-border-width*    2
      *float-window-border*       2
      *float-window-title-height* 15
      *window-border-style*       :tight
      *window-format*             "%n:%t")


(setf *key-seq-color* "^2")
(setf *which-key-format* (concat *key-seq-color* "*~5a^n ~a"))


(setf *input-window-gravity*     :center
      *message-window-padding*   30
      *message-window-y-padding* 25
      *message-window-gravity*   :center
      *message-window-input-gravity* :center)


(load-module "swm-gaps")
(setf swm-gaps:*head-gaps-size*  5
      swm-gaps:*inner-gaps-size* 10
      swm-gaps:*outer-gaps-size* 4)

(when *initializing*
  (swm-gaps:toggle-gaps))
