;; User variables
(defvar efs/default-font "JetBrainsMono Nerd Font")
(defvar efs/default-font-size 120)
(defvar efs/default-variable-font "Helvetica")
(defvar efs/default-variable-font-size 120)

;; Startup performance
(setq gc-cons-threshold (* 50 1000 1000))

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

;; Straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(use-package straight
  :custom
  (straight-use-package-by-default t))

;; Keep things tidy
(use-package no-littering)
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

;; UI
(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)
(setq visible-bell nil)

(column-number-mode)
(global-display-line-numbers-mode t)
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package which-key
  :config
  (which-key-mode 1))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-gruvbox t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;;(use-package autothemer :ensure t)
;;(straight-use-package
 ;;'(rose-pine-emacs
   ;;:host github
   ;;:repo "thongpv87/rose-pine-emacs"
   ;;:branch "master"))
;;(load-theme 'rose-pine-color t)

(set-face-attribute 'default nil :font efs/default-font :height efs/default-font-size)
(set-face-attribute 'fixed-pitch nil :font efs/default-font :height efs/default-font-size)
(set-face-attribute 'variable-pitch nil :font efs/default-variable-font :height efs/default-variable-font-size :weight 'regular)


;; Input
(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-escape
  :config
  (setq evil-escape-unordered-key-sequence t)
  (setq-default evil-escape-key-sequence "jk")
  (evil-escape-mode 1))

;; Programming
(use-package company)
(add-hook 'after-init-hook 'global-company-mode)

(use-package yasnippet
  :config
  (yas-global-mode 1))
(use-package yasnippet-snippets
  :after yasnippet)

(use-package docker-compose-mode)

(use-package consult)

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  ;;:custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/code")
    (setq projectile-project-search-path '("~/code")))
  (setq projectile-switch-project-action #'projectile-dired))

;; ORG mode
(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)))

  (push '("conf-unix" . conf-unix) org-src-lang-modes))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "6454421996f0508c38215a633256e36c19a28591542fb0946cfc40f1dceb89cf" "e9aa348abd3713a75f2c5ba279aa581b1c6ec187ebefbfa33373083ff8004c7c" default))
 '(package-selected-packages '(no-littering)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
