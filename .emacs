;; auto-save-list into ~/.emacs-save
(setq auto-save-list-file-name "~/.emacs-save")

;; add home directory to load path
(add-to-list 'load-path "/home/CHANGEME/.emacs.d/")

;; fill out to column 76
(setq-default fill-column 76)

;; display line number
(setq line-number-mode t)

;; Get rid of load screen
(setq inhibit-splash-screen t)

;; display time
(display-time)

;; programming modes
(autoload 'java-mode "cc-mode" "java" t)
(autoload 'c++-mode  "cc-mode" "c++"  t)
(autoload 'c-mode    "cc-mode" "c"    t)

;; python-mode
(require 'python-mode)
(setq auto-mode-alist
  (append '(("\\.py$" . python-mode)
    ) auto-mode-alist
  ))
(setq py-indent-offset 4)

;; turn on linum-mode when python-mode fires
(defun my-python-mode-hook ()
  (linum-mode 1))
(add-hook 'python-mode-hook 'my-python-mode-hook)

;; visual-basic-mode
(autoload 'visual-basic-mode "visual-basic-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.asp$" . visual-basic-mode))
(add-to-list 'auto-mode-alist '("\\.bas$" . visual-basic-mode))
(add-to-list 'auto-mode-alist '("\\.cls$" . visual-basic-mode))
(add-to-list 'auto-mode-alist '("\\.vbs$" . visual-basic-mode))

;; nxml-mode
(require 'nxml-mode)
(setq auto-mode-alist
  (append '(("\\.docbook$" . nxml-mode)
   ) auto-mode-alist
  ))

;; javascript-mode
(autoload 'javascript-mode "javascript" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))
(setq js-indent-level 4)

;; cc-mode customizations
(require 'cc-mode)
(defun cc-linux-hook ()
  ;; start with default linux formatting
  (c-set-style "linux")

  (setq
   c-hanging-braces-alist (append c-hanging-braces-alist
                                  '((inline-open after)
                                    (class-open after)
                                    ))
   c-cleanup-list         (append c-cleanup-list
                                  '(brace-elseif-brace
                                    defun-close-semi
                                    ))
   c-auto-newline t
   )
  ;; turn on linum-mode too
  (linum-mode 1)
  )

(add-hook 'c-mode-common-hook 'cc-linux-hook)

;; SASS mode
(add-to-list 'load-path "/home/CHANGEME/.emacs.d/scss-mode.el")
(require 'scss-mode)
(setq-default scss-compile-at-save nil)

;; indent with spaces, not tabs and set defaults to 4
(setq-default indent-tabs-mode nil)
(setq-default sgml-basic-offset 4)
(setq-default nxml-child-indent 4)

;; font-lock configuration
(require 'font-lock)
(setq-default font-lock-maximum-decoration t)
(setq-default font-lock-maximum-size 1000000)
(setq-default font-lock-use-colors '(color))
(setq-default font-lock-auto-fontify t)
(global-font-lock-mode t)

;; Adobe Source Code Pro font, 11 pt
;; http://blogs.adobe.com/typblography/2012/09/source-code-pro.html
;; http://stefanv.github.com/blog/2012/09/26/consolas-vs-source-code-pro/
(set-default-font "Source Code Pro-11")

;; global bindings
(global-set-key "\M-g" 'goto-line)

;; white space trim mode
;; https://github.com/glasserc/ethan-wspace
(require 'ethan-wspace)
(global-ethan-wspace-mode 1)

;; personal settings
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(scroll-bar-mode (quote right))
 '(tool-bar-mode nil nil (tool-bar))
 '(user-mail-address "CHANGEME@EXAMPLE.COM"))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; Solarized theme
;; https://github.com/sellout/emacs-color-theme-solarized
(require 'color-theme-solarized)
(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-solarized-dark)
