(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

(defvar my-packages '(better-defaults paredit idle-highlight-mode ido-ubiquitous
                                      find-file-in-project magit smex scpaste color-theme-solarized))

(package-initialize)
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(set-default-font "Source Code Pro-12")
;; (load-theme 'solarized-light t)
(setq inhibit-startup-message t)

(windmove-default-keybindings)
(electric-pair-mode)

(idle-highlight-mode)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Push mark when using ido-imenu
 
(defvar push-mark-before-goto-char nil)
 
(defadvice goto-char (before push-mark-first activate)
  (when push-mark-before-goto-char
    (push-mark)))
 
(defun ido-imenu-push-mark ()
  (interactive)
  (let ((push-mark-before-goto-char t))
    (idomenu)))

(global-set-key (kbd "C-x C-i") 'ido-imenu-push-mark)
