;;; package --- Summary
;;; Commentary:
;;; Code:

;;; Defining Quickrun Function
(defun my-quickrun ()
  "Execute quickrun command."
  (interactive)
  (quickrun-shell))

;;; Binding above function to F5 key
(global-set-key (kbd "<f5>") 'my-quickrun)

(define-key global-map [Run]
  '(menu-item "Run" my-quickrun))
(tool-bar-add-item "Run" 'my-quickrun :help "Click me to run programs!")

(provide 'run)
;;; run.el ends here
