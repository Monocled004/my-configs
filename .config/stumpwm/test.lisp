
(ql:quickload '(:dbus :bordeaux-threads :stumpwm))
(defpackage #:media
  (:use #:cl
	#:dbus
	#:bordeaux-threads)
  (:export #:*media-event-received-hook*
	   #:media-server-toggle
           #:media-server-on
           #:media-server-off))
(in-package #:media)

(defvar *media-event-received-hook* '(log-media-event)
  "Function to execute when a media event is received.")

(defvar *media-server-is-on* nil
  "Does media-server listen to media events?")

(defvar *media-server-thread* nil
  "DBus listening thread for media events.")

(defparameter *media-server-start-message*
  "Media Server listening for media events.")

(defparameter *media-server-stop-message*
  "Media Server will now stop listening for media events.")

(defun log-media-event (title artist album)
  "Log the media event metadata to a file."
  (with-open-file (out "/tmp/mediametadata"
                       :direction :output
                       :if-exists :append
                       :if-does-not-exist :create)
    (write-string (format nil "Title: ~A, Artist: ~A, Album: ~A" title artist album))))

(define-dbus-object media-dbus-service
    (:path "/org/mpris/MediaPlayer2"))

(define-dbus-method (media-dbus-service track-change)
    ((title :string) (artist :string) (album :string))
  (:void)
  (:interface "org.mpris.MediaPlayer2.Player")
  (:name "TrackChange")
  (stumpwm:run-hook-with-args *media-event-received-hook* title artist album))

(defun media-events-listen ()
  (handler-case
      (with-open-bus (bus (session-server-addresses))
    (with-introspected-object
        (media-events bus "/org/freedesktop/DBus" "org.freedesktop.DBus")
      (media-events "org.freedesktop.DBus" "RequestName"
             "org.mpris.MediaPlayer2.Player" 0))
    (publish-objects bus))
    (end-of-file ()
      :disconnected-by-bus)))

(defun media-server-on ()
  "Turns on media server."
  (unless *media-server-is-on*
    (setf *media-server-thread*
          (make-thread #'media-events-listen :name "media-listener"))
    (setf *media-server-is-on* t)
    (stumpwm:message *media-server-start-message*)))

(defun media-server-off ()
  "Turns off media server."
  (destroy-thread *media-server-thread*)
  (setf *media-server-is-on* nil)
  (stumpwm:message *media-server-stop-message*))

(stumpwm:defcommand media-server-toggle () ()
  "Toggles media server."
  (if *media-server-is-on*
      (media-server-off)
      (media-server-on)))

(media-server-on)
(format t "orighi")
