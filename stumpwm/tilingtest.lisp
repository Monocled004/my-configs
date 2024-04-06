
(in-package :stumpwm)
(setf *default-package* :stumpwm)

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

#|
(defun tiling-stack-right (current-screen)
  (resize ('200 '0))
  (let (if ())))
|#
