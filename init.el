(require 'package)

(setq default-directory "~/")
(setq command-line-default-directory "~/")

(setq package-archives
      '(("melpa stable" . "https://stable.melpa.org/packages/")
	("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/"))
      package-archive-priorities
      '(("melpa" . 100)
	("melpa stable" . 50)
        ("elpa" . 25)))

(defvar packages-list
  '(ag
    company
    exec-path-from-shell
    eclipse-theme
    flycheck
    fzf
    github-theme
    green-phosphor-theme
    gruvbox-theme
    lox-mode
    lsp-mode
    lsp-treemacs
    magit
    package-lint
    paredit
    rust-mode
    slime))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(let ((packages-refreshed nil))
  (dolist (package packages-list)
    (unless (package-installed-p package)
      (unless packages-refreshed
        (package-refresh-contents)
        (setq packages-refreshed t))
      (package-install package))))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq
 split-width-threshold 0
 split-height-threshold nil)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(defun ignore-windmove-error (fn)
  "Mute errors when no other window exists while invoking FN."
  (lambda ()
    (interactive)
    (ignore-errors
      (funcall fn))))

(global-set-key [s-left] (ignore-windmove-error 'windmove-left))
(global-set-key [s-right] (ignore-windmove-error 'windmove-right))
(global-set-key [s-up] (ignore-windmove-error 'windmove-up))
(global-set-key [s-down] (ignore-windmove-error 'windmove-down))

(add-to-list 'default-frame-alist '(font . "Ubuntu Mono-14"))

(setq make-backup-files nil)
(setq auto-save-default nil)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(setq help-window-select t)

(add-hook 'after-init-hook 'global-company-mode)
(electric-pair-mode 1)
(show-paren-mode 1)

(add-hook 'prog-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (electric-pair-mode 1)
            (paredit-mode 1)))

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (paredit-mode 1)
	    (define-key emacs-lisp-mode-map (kbd "C-x C-e") 'pp-eval-last-sexp)))

(global-set-key (kbd "M-t") 'fzf)
(global-set-key (kbd "M-g") 'ag)

;; org mode

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "DONE")))

;; common lisp

(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
;; source - http://hectorhon.blogspot.com/2020/02/getting-compilation-output-of-asdfload.html
(setq slime-contribs '(slime-fancy slime-asdf))
(setf asdf:*compile-file-warnings-behaviour* :error)

;; rust

(add-hook 'rust-mode-hook
          (lambda () (seteq indent-tabs-mode nil)))

(setq rust-format-on-save t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(green-phosphor))
 '(custom-safe-themes
   '("d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298" "4eb69f17b4fa0cd74f4ff497bb6075d939e8d8bf4321ce8b81d13974000baac1" "00c5138bb71c95ca37a0fc845656498a8b4ff271ba4e0e0845732d188359d55a" "1d78d6d05d98ad5b95205670fe6022d15dabf8d131fe087752cc55df03d88595" "08765d801b06462a3ce7e414cdb747436ccaf0c073350be201d8f87bd0481435" default))
 '(package-selected-packages
   '(vterm verona-mode blackboard-theme slime paredit package-lint magit lox-mode green-phosphor-theme github-theme fzf exec-path-from-shell eclipse-theme company ag)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
