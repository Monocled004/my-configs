;; Loading my theme
(load-theme 'my t)
(load "/home/yash/.emacs.d/fixed-errors.el")
(tab-bar-mode 1)
(tab-line-mode 1)

;; Adding Melpa packages in emacs
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Yasnippet enabling at startup
(require 'yasnippet)
(yas-global-mode 1)

;; Auto complete package initialization
(require 'auto-complete
	 (global-auto-complete-mode t)
	 )

;; flycheck for clang 
(require 'auto-complete
	 (require 'flycheck
		  (global-flycheck-mode t)))

;; Shortcut for quickrun command
(require 'quickrun)
(load "/home/yash/.emacs.d/run.el")

;; key bindings for buffer switching
(load "/home/yash/.emacs.d/myshortcuts.el")

;; Loading Treemacs on startup
(add-hook 'emacs-startup-hook 'treemacs)
