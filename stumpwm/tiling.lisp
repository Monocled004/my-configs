
(defun tiling-add (window-id)
  (let ((frame (window-frame window-id)))
	(if (not (= 1 (length (screen-windows (current-screen)))))
	    (if (> (frame-width frame) (frame-height frame))
		(hsplit)
		(vsplit)))))
(stumpwm:add-hook *new-window-hook* 'tiling-add)

(defun tiling-remove (window-id)
  (let ((frame (window-frame window-id)))
    (if (not (= 0 (length (screen-frames (current-screen)))))
	(if (= 1 1)
	    (if (< 1 (length (screen-frames (current-screen))))
		(progn (remove-split)
		       (balance-frames))
		(remove-split))))))
(stumpwm:add-hook *destroy-window-hook* 'tiling-remove)


