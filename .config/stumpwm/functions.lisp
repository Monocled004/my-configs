
(load-module "ttf-fonts")
;;;(load "~/.config/stumpwm/test.lisp")

;
(defvar *player* "spotify")
(add-screen-mode-line-formatter #\Z 'modeline-player)
(add-screen-mode-line-formatter #\z 'modeline-brightness)

(defun modeline-player (ml)
  (declare (ignore ml))
  (let ((ml-str (player *player*)))
    (format-with-on-click-id ml-str :ml-media nil)))

(defun modeline-brightness (ml)
  (declare (ignore ml))
  (let ((ml-str (brightness)))
    (format-with-on-click-id ml-str :ml-brightness nil)))

(defun read-metadata (file-path)
  (with-open-file (stream file-path)
    (format nil (read-line stream nil))))

(defun player (player-name)
  (let* ((song-title
           (concatenate 'string
                        (if (string= player-name "spotify")
                            (format nil "  ")
                            (format nil "  "))
                        (if (probe-file "/tmp/mediametadata")
                            (read-metadata "/tmp/mediametadata")
                            nil)))
         (trimmed
           (subseq song-title 0 (- (length song-title) 1))))
    (if (< (length trimmed) 20)
          (concatenate 'string
                       trimmed
                       " . . ."
                       (make-string (- 19 (length trimmed)) :initial-element #\Space))
        (concatenate 'string
                     (subseq trimmed 0 18)
                     " . . ."))))

(defun play-pause (code id)
  (let ((button (decode-button-code code)))
    (case button
      ((:left-button)
       (run-shell-command (format nil "playerctl play-pause --player=~A" *player*)))
      ((:right-button)
       (run-shell-command (format nil "playerctl next --player=~A" *player*)))
      ((:middle-button)
       (run-shell-command (format nil "playerctl previous --player=~A" *player*))))))
(register-ml-on-click-id :ml-media #'play-pause)

(defun wifi ()
  (let ((essid (stumpwm:run-shell-command "nmcli device wifi list | awk '/*/ {print $3}'" t)))
  (subseq essid 0 (- (length essid) 1))))

(defun brightness ()
  (let* ((back-value (run-shell-command "brightnessctl -P | awk '/%/ {print $4}'" t))
         (trimmed (subseq back-value 1 (- (length back-value) 3))))
    (cond ((<= (parse-integer trimmed) 30)
           (format nil "󱩐 ~A%" trimmed))
          ((and (> (parse-integer trimmed) 30) (<= (parse-integer trimmed) 60))
           (format nil "󱩓 ~A%" trimmed))
          ((and (> (parse-integer trimmed) 60) (<= (parse-integer trimmed) 100))
           (format nil "󰛨 ~A%" trimmed)))))

(defun brightness-ctl (code id)
  (let ((button (decode-button-code code)))
    (case button
      ((:wheel-up)
       (run-shell-command "brightnessctl s +10%"))
      ((:wheel-down)
       (run-shell-command "brightnessctl s 10%-"))))
  (stumpwm::update-all-mode-lines))
(register-ml-on-click-id :ml-brightness #'brightness-ctl)
