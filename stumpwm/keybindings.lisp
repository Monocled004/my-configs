
(in-package :stumpwm)
(setf *default-package* :stumpwm)


;;; removing existing keybindings of StumpWM in root-map
(undefine-key *root-map* (kbd "s"))
(undefine-key *root-map* (kbd "S"))
(undefine-key *root-map* (kbd "v"))
(undefine-key *root-map* (kbd "V"))
(undefine-key *root-map* (kbd "i"))
(undefine-key *root-map* (kbd "f"))
(undefine-key *root-map* (kbd "F"))
(undefine-key *root-map* (kbd "Q"))
(undefine-key *root-map* (kbd "a"))
(undefine-key *root-map* (kbd "c"))
(undefine-key *root-map* (kbd "C"))
(undefine-key *root-map* (kbd "e"))

(defvar *my-app-bindings*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "f") "exec firefox")
    (define-key m (kbd "e") "exec emacs")
    (define-key m (kbd "t") "exec kitty")
    (define-key m (kbd "n") "exec nautilus")
    m ; NOTE: this is important
    ))

;;; Defining root key map and adding my-app-bindings to it
(define-key *root-map* (kbd "a") '*my-app-bindings*)
(define-key *root-map* (kbd "c") "exec konsole")
(define-key *root-map* (kbd "C") "exec konsole")
(define-key *root-map* (kbd "e") "exec")
(define-key *root-map* (kbd "s") "hsplit")
(define-key *root-map* (kbd "S") "hsplit")
(define-key *root-map* (kbd "v") "vsplit")
(define-key *root-map* (kbd "V") "vsplit")
(define-key *root-map* (kbd "i") "iresize")
(define-key *root-map* (kbd "f") "fullscreen")
(define-key *root-map* (kbd "F") "curframe")
(define-key *root-map* (kbd "Q") "quit-confirm")
(define-key *my-app-bindings* (kbd "a") "exec rofi -show drun")
