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

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(setq mouse-drag-copy-region nil)
(global-set-key (kbd "<mouse-2>") nil)

(setq x-select-enable-primary nil)
(setq x-select-enable-clipboard nil)
(global-set-key (kbd "C-c y") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-c p") 'clipboard-yank)

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

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

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

;;; Dockerfile
(use-package dockerfile-mode
  :ensure t)

;;; Yaml
(use-package yaml-mode
  :ensure t)

;;; Theme
(use-package twilight-theme
  :ensure t)

(load-theme 'twilight)

(add-hook 'window-setup-hook 'on-after-init)

