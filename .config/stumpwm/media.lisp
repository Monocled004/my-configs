(ql:quickload '(:dbus :bordeaux-threads :stumpwm))
(defpackage #:media
  (:use #:cl
	#:dbus
	#:bordeaux-threads)
  (:export #:*media-changed-hook*
	   #:media-server-toggle
           #:media-server-on
           #:media-server-off))
(in-package #:media)

(defvar *media-changed-hook* '(show-media-metadata)
  "Function to execute when media changes and metadata is retrieved.")

(defvar *media-server-is-on* nil
  "Does media-server listen to notifications?")

(defvar *media-server-thread* nil
  "DBus listening thread")

(defparameter *media-server-start-message*
  "Notification Server listening for notifications.")

(defparameter *media-server-stop-message*
  "Notification Server will now stop listening for notifications.")

(defparameter *media-server-max-title-lines* 2)
(defparameter *media-server-max-body-lines* 20)
(defparameter *media-server-max-line-length* 100)

(defparameter *media-server-title-color* "^1")
(defparameter *media-server-body-color* "^7")

(defvar *metadata-file* "/tmp/mediametadata"
  "File to write media metadata.")

(defun write-metadata-to-file (artist album title)
  "Write the metadata to a file."
  (with-open-file (out *metadata-file*
                       :direction :output
                       :if-exists :supersede
                       :if-does-not-exist :create)
    (format out "Artist: ~A~%Album: ~A~%Title: ~A~%~%"
            artist album title)))

(defun media-metadata-changed (artist album title)
  "Callback function to be executed when media metadata changes."
  (write-metadata-to-file artist album title))

(define-dbus-object media-dbus-service
    (:path "/org/mpris/MediaPlayer2"))

(define-dbus-method (media-dbus-service update-metadata)
    ((artist :string) (album :string) (title :string))
  (:void)
  (:interface "org.mpris.MediaPlayer2")
  (:name "UpdateMetadata")
  (media-metadata-changed artist album title))

(defun start-media-metadata-listener ()
  "Start the DBus listener for media metadata updates."
  (handler-case
      (with-open-bus (bus (session-server-addresses))
        (with-introspected-object
            (media-player bus "/org/mpris/MediaPlayer2" "org.mpris.MediaPlayer2")
          (media-player "org.mpris.MediaPlayer2" "RequestName"
                        "org.mpris.MediaPlayer2" 0))
        (publish-objects bus))
    (end-of-file ()
      :disconnected-by-bus)))

(defun media-metadata-listener-on ()
  "Turns on the media metadata listener."
  (unless *media-server-is-on*
    (setf *media-server-thread*
          (make-thread #'start-media-metadata-listener :name "media-listener"))
    (setf *media-server-is-on* t)
    (format t *media-server-start-message*)))

(defun media-metadata-listener-off ()
  "Turns off the media metadata listener."
  (destroy-thread *media-server-thread*)
  (setf *media-server-is-on* nil)
  (format t *media-server-stop-message*))

(stumpwm:defcommand media-metadata-listener-toggle () ()
  "Toggles the media metadata listener."
  (if *media-server-is-on*
      (media-metadata-listener-off)
      (media-metadata-listener-on)))

(media-metadata-listener-on)

#|
(defun show-media-metadata (title artist album)
  "Show the media metadata instead of notification."
  (format nil "~A: ~A- ~A" title artist album))

(define-dbus-object media-dbus-service
    (:path "/org/mpris/MediaPlayer2"))

(define-dbus-method (media-dbus-service properties-changed)
    ((interface-name :string) (changed-properties (:dict-entry :string :variant))
     (invalidated-properties (:array :string)))
  (:interface "org.freedesktop.DBus.Properties")
  (:name "PropertiesChanged")
  (format t "Received PropertiesChanged signal with interface-name: ~A~%" interface-name)
  (when (string= (if interface-name
                     interface-name
                     (setf interface-name ""))
                 "org.mpris.MediaPlayer2.Player")
    (let ((title (cdr (assoc "xesam:title" changed-properties)))
          (artist (cdr (assoc "xesam:artist" changed-properties)))
          (album (cdr (assoc "xesam:album" changed-properties))))
      (stumpwm:run-hook-with-args *media-changed-hook* title artist album))))

(defun media-listen ()
  (handler-case
      (with-open-bus (bus (session-server-addresses))
        (with-introspected-object
            (media bus "/org/freedesktop/DBus" "org.freedesktop.DBus")
          (media "org.freedesktop.DBus" "RequestName"
                 "org.mpris.MediaPlayer2" 0))
        (publish-objects bus))
    (end-of-file ()
      :disconnected-by-bus)))

(defun media-server-on ()
  "Turns on media server."
  (unless *media-server-is-on*
    (setf *media-server-thread*
          (make-thread #'media-listen :name "media-listener"))
    (setf *media-server-is-on* t)
    (stumpwm:message *media-server-start-message*)))

(defun media-server-off ()
  "Turns off media server"
  (destroy-thread *media-server-thread*)
  (setf *media-server-is-on* nil)
  (stumpwm:message *media-server-stop-message*))

(stumpwm:defcommand media-server-toggle () ()
  "Toggles media server."
  (if *media-server-is-on*
      (media-server-off)
      (media-server-on)))
|#
