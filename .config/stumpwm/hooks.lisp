
(in-package :stumpwm)
(setf *default-package* :stumpwm)

(mapcar
 #'(lambda(i) (remove-all-hooks i))
 '(*new-window-hook* *destroy-window-hook* *start-hook* *quit-hook*))

(defun tiling-add (window-id)
  (let ((frame (window-frame window-id)))
    (if (not (= 1 (length (group-windows (current-group)))))
        (if (> (frame-width frame) (frame-height frame))
            (hsplit)
            (vsplit)))))
(stumpwm:add-hook *new-window-hook* 'tiling-add)

(defun tiling-remove (window-id)
  (let ((frame (window-frame window-id)))
    (if (not (= 1 (length (group-frames (current-group)))))
        (if (< 2 (length (group-frames (current-group))))
            (progn (remove-split)
                   (balance-frames))
            (remove-split)))))
(stumpwm:add-hook *destroy-window-hook* 'tiling-remove)


(defun start-shell ()
  ;;; starting picom
  (run-shell-command "picom --config ~/.config/picom/picom.conf")
  ;;; syncing doom emacs
  (run-shell-command "~/.config/emacs/bin/doom sync")
  ;;; starting emacs daemon
  (run-shell-command "emacs --fg-daemon")
  ;;; Setting up Wallpaper at startup
  (run-shell-command "bash ~/.config/scripts/random.sh")
  ;(run-shell-command "python ~/.config/stumpwm/media.py")
  ;;; loading polybar
  (run-shell-command "bash ~/.config/polybar/launch.sh --forest")
  ;;; creating groups
  (gnew "g2")
  (gnew "g3")
  (gnew "g4")
  (gselect "1")
  (grename "g1"))
(stumpwm:add-hook *start-hook* 'start-shell)


(defun quit-shell ()
  (run-shell-command "if pgrep -f random.sh >> /dev/null; then pkill -f random.sh; fi"))
(stumpwm:add-hook *quit-hook* 'quit-shell)
