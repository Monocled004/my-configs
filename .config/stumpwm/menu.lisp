
(ql:quickload "split-sequence")
(ql:quickload "split-sequence")
(defun my-menu-fun ()
  (let* ((menu-items
           '(("Option1" . 1)
             ("Option2" . 2)
             ("Quit" . 3)))
         (selection (select-from-menu (current-screen) menu-items)))
    (when selection
      (message "you selected: %s" (car selection)))))

(defcommand my-menu () (:key)
  (my-menu-fun))

(defun player-menu-fun ()
  (let* ((menu-items
           (split-sequence:split-sequence #\Newline
                                          (run-shell-command "playerctl --list-all" t)))
         (selection (select-from-menu (current-screen) menu-items)))
    (when selection
      (setf *player* (car selection))))
  (message "Player set to ~A" *player*))
(defcommand player-menu () (:key)
  (player-menu-fun))

(defun bluetooth-menu ()
  (let* ((menu-items
           (split-sequence:split-sequence
            #\Newline
            (run-shell-command "bluetoothctl devices | awk '{print $3$4$5}'" t)))
         (ids
           (split-sequence:split-sequence
            #\Newline
            (run-shell-command "bluetoothctl devices | awk '{print $2}'" t)))
         (pairs
           (pairlis menu-items ids))
         (selection (assoc (select-from-menu (current-screen) menu-items) pairs)))
    (when selection
      (run-shell-command (format t "bluetoothctl connect ~A" (cdr selection)) t))))

(defun network-menu ()
  (let* ((menu-items
           (split-sequence:split-sequence #\Newline
                                          (run-shell-command "playerctl --list-all" t)))
         (selection (select-from-menu (current-screen) menu-items)))
    (when selection
      (setf *player* (car selection))))
  (message "Player set to ~A" *player*))

(defun files-menu ()
  (let* ((menu-items
           (split-sequence:split-sequence #\Newline
                                          (run-shell-command "playerctl --list-all" t)))
         (selection (select-from-menu (current-screen) menu-items)))
    (when selection
      (setf *player* (car selection))))
  (message "Player set to ~A" *player*))
