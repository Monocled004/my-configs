(defpackage :clx-example
  (:use :cl :stumpwm))
(in-package :clx-example)

(defun load-jpeg (filename)
  (let ((image (cl-jpeg:decode-image filename)))
    (multiple-value-bind (width height) (cl-jpeg:jpeg-file-dimensions filename)
      (let ((pixels (cl-jpeg:jpeg-image-pixels image)))
        (values width height pixels)))))

(defun create-window ()
  (let* ((display (xlib:open-default-display))
         (screen (xlib:default-screen display))
         (root (xlib:screen-root screen))
         (window (xlib:create-window display root
                                     :x 0 :y 0
                                     :width 800 :height 600
                                     :border-width 0
                                     :class :input-output
                                     :visual (xlib:screen-visual screen)
                                     :depth (xlib:screen-root-depth screen)
                                     :attributes (list :background-pixel (xlib:screen-white-pixel screen)
                                                       :override-redirect t))))
    (xlib:map-window window)
    (xlib:flush display)
    (set-window-opacity display window 0.5)  ; Set opacity to 50%
    window))

(defun set-window-opacity (display window opacity)
  (let ((atom (xlib:intern-atom display "_NET_WM_WINDOW_OPACITY" t)))
    (when atom
      (xlib:change-property display window atom xlib:xa-cardinal 32
                            (list (round (* opacity #xffffffff)))))))

(defun display-image (window filename)
  (multiple-value-bind (width height pixels) (load-jpeg filename)
    (let* ((display (xlib:window-display window))
           (gc (xlib:create-gcontext display window))
           (image (xlib:create-image display (xlib:default-visual display)
                                     (xlib:default-depth display)
                                     :z-pixmap width height
                                     :data pixels)))
      (xlib:put-image display window gc image 0 0 0 0 width height)
      (xlib:flush display))))

(defun main ()
  (let ((window (create-window)))
    (display-image window "../wallpaper/zalem.jpg")
    (sleep 10)))

(main)
