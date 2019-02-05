;; Prevent Emacs from automatically adding a (package-initialize) call to init.el
(setq package--init-file-ensured t)

;; Alter GC behavior (flx recommended)
(setq gc-cons-threshold 20000000)

; Set the temporary directory to /tmp
(setenv "TMPDIR" "/tmp")
(setq temporary-file-directory "/tmp")

(add-to-list 'load-path "~/.emacs.d/lisp/")
(when (display-graphic-p)
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes"))

; (global-auto-revert-mode t)

; Add common tools to the path on OS X
;(require 'exec-path-from-shell)
;(when (memq window-system '(mac ns))
;  (exec-path-from-shell-initialize))

;; smooth mouse scrolling
(setq redisplay-dont-pause t
      mouse-wheel-progressive-speed nil
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(put 'downcase-region 'disabled nil)

;; Make cmd button work as the meta key
(setq mac-option-modifier nil
      mac-command-modifier 'meta)

;; enable desktop
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(setq desktop-base-file-name "emacs-desktop")
(require 'desktop)
(desktop-save-mode 1)

;; Set up indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4
              python-indent-offset 4)

;; Show the line where a parenthese is matching
(defadvice show-paren-function
    (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in the
echo area. Has no effect if the character before point is not of
the syntax class ')'."
  (interactive)
  (let* ((cb (char-before (point)))
         (matching-text (and cb
                             (char-equal (char-syntax cb) ?\) )
                             (blink-matching-open))))
    (when matching-text (message matching-text))))

;; Keybinds
(global-set-key (kbd "C-c f") 'toggle-frame-fullscreen)
(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key (kbd "<C-S-tab>") (lambda ()
                                    (interactive)
                                    (other-window -1)))
(global-set-key (kbd "C-c g") 'magit-status)

;; Make answering to yes/no questions easier
(fset 'yes-or-no-p 'y-or-n-p)

;; Don't blink the cursor
(blink-cursor-mode -1)

;; Show column number with line number
(column-number-mode 1)

;; Disable tool bar
(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0)
  (menu-bar-mode 0))

;; Don't show the splash screen nor the startup message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Set up the calendar
(setq calendar-latitude +58)
(setq calendar-longitude +17)

;; Parenthesis highlighting
(show-paren-mode 1)
(setq show-paren-delay 0)
;; (setq show-paren-style 'expression)

;; turn off autosave
(setq auto-save-default nil)
;; put autosave files to the temporary directory
;; (setq auto-save-file-name-transforms
;;           `((".*" ,temporary-file-directory t)))

;; Make sure that backups are not saved in the file's directory
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs.d/backup"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

(defvar notifier-path
  "/Applications/terminal-notifier.app/Contents/MacOS/terminal-notifier")

(defun notify (msg &optional title)
  (shell-command (concat notifier-path
                         " -sender org.gnu.emacs "
                         " -message " "\"" msg "\""
                         (if title
                             (concat " -title " title)
                           )
                         ))
  nil)

(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/init_real.el")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "1fa76c8d9baaeb5dc498d2a4baaf71be6d3a8b6412af994d691fbe7a7b167321" default)))
 '(desktop-save t)
 '(magit-diff-use-overlays nil)
 '(magit-git-executable "/usr/bin/git")
 '(magit-repository-directories '(("~/git" . 2)))
 '(ns-use-native-fullscreen t)
 '(package-selected-packages
   (quote
    (solarized-theme smart-mode-line projectile markdown-mode magit js2-mode flx-ido))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
