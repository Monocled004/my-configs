(in-package :stumpwm)

(ql:quickload "clx-truetype")
(ql:quickload "split-sequence")
(load "~/.config/stumpwm/colors.lisp")
(load "~/.config/stumpwm/functions.lisp")

(setf *mode-line-position* :top)

;; (load-module "app-menu")
(load-module "battery-portable")
(load-module "cpu")
(load-module "mem")
(load-module "ttf-fonts")
(load-module "pamixer")

(setf *window-format* "%20c")
(setf *time-format-string-default* "󰃭 %d/%m/%Y, 󰥔 %I:%M %p")
(setf *time-modeline-string* "󰥔 %I:%M %p")
(setf cpu::*cpu-modeline-fmt* (format nil "^(:bg \"~A\") %c" cat-surface1))
(setf cpu::*cpu-usage-modeline-fmt* "^[~A~3D%^]")
(setf pamixer:*modeline-fmt* "󰕾 %v")
(setf mem::*mem-modeline-fmt* " %a")
(setf *group-format* " 󰍹 ")

(let ((battery (format nil
                 "^(:fg \"~A\")^(:bg \"~A\")^(:fg \"~A\")^(:bg \"~A\")󰁹 %B^(:fg \"~A\")^(:bg \"~A\")"
                 cat-surface1 cat-base cat-sky cat-surface1 cat-surface1 cat-base))
      (groups (format nil
                 "^(:fg \"~A\")^(:bg \"~A\")^(:fg \"~A\")^(:bg \"~A\")%g^(:fg \"~A\")^(:bg \"~A\")"
                 cat-surface1 cat-base cat-lavender cat-surface1 cat-surface1 cat-base))
      (current-group "%n")
      (sep (format nil
                   " ^(:fg \"~A\")| "
                   cat-surface2))
      (align-right "^>")
      (hidden-windows "%V")
      (cpu (format nil
                 "^(:fg \"~A\")^(:bg \"~A\")^(:fg \"~A\")^(:bg \"~A\")%C^(:fg \"~A\")^(:bg \"~A\")"
                 cat-surface1 cat-base cat-rosewater cat-surface1 cat-surface1 cat-base))
      (cpu-bar "%C")
      (cpu-temp "%t")
      (cpu-freq "%f")
      (mem (format nil
                 "^(:fg \"~A\")^(:bg \"~A\")^(:fg \"~A\")^(:bg \"~A\")%M^(:fg \"~A\")^(:bg \"~A\")"
                 cat-surface1 cat-base cat-pink cat-surface1 cat-surface1 cat-base))
      (player (format nil
                 "~A^(:fg \"~A\")^(:bg \"~A\")^(:fg \"~A\")^(:bg \"~A\")%Z^(:fg \"~A\")^(:bg \"~A\")~A"
                       "^(:on-click :ml-media)" cat-surface1 cat-base
                       cat-green cat-surface1
                       cat-surface1 cat-base "^(:on-click-end)"))
      (wifi (format nil
                 "^(:fg \"~A\")^(:bg \"~A\")^(:fg \"~A\")^(:bg \"~A\")󰖩  ~A^(:fg \"~A\")^(:bg \"~A\")"
                       cat-surface1 cat-base
                       cat-yellow cat-surface1 (wifi)
                       cat-surface1 cat-base))
      (date (format nil
                 "^(:fg \"~A\")^(:bg \"~A\")^(:fg \"~A\")^(:bg \"~A\")%d^(:fg \"~A\")^(:bg \"~A\")"
                 cat-surface1 cat-base cat-text cat-surface1 cat-surface1 cat-base))
      (volume (format nil
                      "^(:fg \"~A\")^(:bg \"~A\")^(:fg \"~A\")^(:bg \"~A\")%P^(:fg \"~A\")^(:bg \"~A\")"
                 cat-surface1 cat-base cat-text cat-surface1 cat-surface1 cat-base))
      (backlight (format nil
                      "~A^(:fg \"~A\")^(:bg \"~A\")^(:fg \"~A\")^(:bg \"~A\")%z^(:fg \"~A\")^(:bg \"~A\")~A"
                          "^(:on-click :ml-brightness)" cat-surface1
                          cat-base cat-text cat-surface1
                          cat-surface1 cat-base "^(:on-click-end)"))
      (_ " ")
      (center-padding (make-string 15 :initial-element #\Space)))
  (let ((left (list groups _ cpu _ mem _ date center-padding player))
        (right (list volume _ backlight _ wifi _ battery)))
    (setf *screen-mode-line-format*
          (list left align-right right))))

(setf *mode-line-pad-x* 12)
(setf *mode-line-pad-y* 12)

(setf *mode-line-timeout* 3)

(unless (stumpwm::head-mode-line (current-head))
  (toggle-mode-line (current-screen) (current-head)))
