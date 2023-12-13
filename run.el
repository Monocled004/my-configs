(defun my-quickrun ()
  "Execute quickrun command."
  (interactive)
  (quickrun-shell))
(global-set-key (kbd "<f5>") 'my-quickrun)

(define-key global-map [Run]
  '(menu-item "Run" my-quickrun))
(tool-bar-add-item "Run" 'my-quickrun :help "Click me to run programs!")
(provide 'run)
;;;run.el ends here
