(setq tls-checktrust t)

(setq package-enable-at-startup nil)
(setq inhibit-startup-screen t
      initial-buffer-choice  nil)
(emacs-lock-mode -1)
(set-face-attribute 'default nil :height 130)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("450f3382907de50be905ae8a242ecede05ea9b858a8ed3cc8d1fbdf2d57090af" "dd4628d6c2d1f84ad7908c859797b24cc6239dfe7d71b3363ccdd2b88963f336" "f66abed5139c808607639e5a5a3b5b50b9db91febeae06f11484a15a92bde442" default)))
 '(package-selected-packages
   (quote
    (## twilight-theme evil-terminal-cursor-changer js-mode pug-mode indium vue-mode js2-mode evil-magit magit use-package helm evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun on-after-init ()
  (unless (display-graphic-p)
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package helm
  :ensure t)

(use-package evil
  :ensure t)
(evil-mode t)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))

(unless (display-graphic-p)
    (use-package evil-terminal-cursor-changer
    :ensure t
    :init
    (setq evil-motion-state-cursor 'box)  ; █
    (setq evil-visual-state-cursor 'box)  ; █
    (setq evil-normal-state-cursor 'box)  ; █
    (setq evil-insert-state-cursor 'bar)  ; ⎸
    (setq evil-emacs-state-cursor  'hbar) ; _
    :config
    (etcc-on)
    ))

;;; JS
(use-package indium
  :ensure t)

(use-package pug-mode
  :ensure t)

(use-package js2-mode
  :ensure t)

(use-package vue-mode
  :ensure t)

;;; Magit
(use-package magit
  :ensure t)
(use-package evil-magit
  :ensure t)
(setq magit-auto-revert-mode nil)
(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)

;;; Theme
(use-package twilight-theme
  :ensure t)

(load-theme 'twilight)

(add-hook 'window-setup-hook 'on-after-init)

