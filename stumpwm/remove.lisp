
(defun tiling-remove (window-id)
  (let ((frame (window-frame window-id)))
    (if (not (= 0 (length (screen-frames (current-screen)))))
	(if (= 1 1)
	    (remove-split)))))

(stumpwm:add-hook *destroy-window-hook* 'tiling-remove)
