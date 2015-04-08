;; Initialize the package system
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(package-refresh-contents)

(defvar my-package-list
  '(flx-ido flx js2-mode magit markdown-mode projectile smart-mode-line zenburn-theme))

(dolist (package my-package-list)
  (when (not (package-installed-p package))
    (package-install package)))

; whitespace mode configuration
(require 'whitespace)
;; highlight lines longer than 120 characters
(setq whitespace-line-column 119)
(setq whitespace-style '(face tabs trailing lines))
(global-whitespace-mode 1) ; enable whitespace-mode globally

;; Remove whitespace on save
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Load the zenburn theme
(load-theme 'zenburn t)

;; Flx and ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;; jedi mode
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)

;; sml
(require 'smart-mode-line)
(setq sml/theme 'respectful)
(sml/setup)
(add-to-list 'sml/replacer-regexp-list '("^~/sources/" ":Git:"))
(setq sml/hidden-modes nil)

;; load projectile and enable it
(require 'projectile)
(projectile-global-mode t)

;; js-mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; (require 'flycheck)
;; (global-flycheck-mode)

(global-set-key
 "\M-x"
 (lambda ()
   (interactive)
   (call-interactively
    (intern
     (ido-completing-read
      "M-x "
      (all-completions "" obarray 'commandp))))))

;(require 'geiser)
;(setq geiser-racket-binary "/Applications/Racket v5.3.6/bin/racket")
