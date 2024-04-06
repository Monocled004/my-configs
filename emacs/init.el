;; Loading my theme
(load-theme 'my t)
(load "/home/yash/.emacs.d/fixed-errors.el")
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Adding Melpa packages in emacs
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(setq inferior-lisp-program "sbcl")

;; Yasnippet enabling at startup
(require 'yasnippet)
(yas-global-mode 1)

;; Auto complete package initialization
(require 'auto-complete
	 (global-auto-complete-mode t))

;; flycheck for clang
(require 'auto-complete
	 (require 'flycheck
		  (global-flycheck-mode t)))

;; Shortcut for quickrun command
(require 'quickrun)
(load "/home/yash/.emacs.d/run.el")

;; key bindings for buffer switching
(load "/home/yash/.emacs.d/my-shortcuts.el")

;; Loading Treemacs on startup
;;(add-hook 'emacs-startup-hook 'treemacs)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "3bd9a27b5d1c2087326136a49d48c9941dac083d7f084ddc01c020367ccac5a1" "d7107d3b839d101f0ef0aa49fa6608b2976d372b263c85faeeed94c73e379a90" "4363ac3323e57147141341a629a19f1398ea4c0b25c79a6661f20ffc44fdd2cb" default))
 '(package-selected-packages
   '(ein yasnippet-snippets slime doom-themes night-owl-theme yasnippet treemacs quickrun flycheck autothemer auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
