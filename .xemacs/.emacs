;;;
;;; .emacs
;;;
;;; Last hacked by cjl 8-6-96
;;;

;; enable ESC-ESC
(put 'eval-expression 'disabled nil)
;; find my elisp code
(setq load-path (cons "~/elisp" load-path))
;; start in text mode
(setq default-major-mode 'text-mode)

;;;
;;; catch c-x c-c
;;;
(defun my-exit-emacs()
  (interactive)
  (cond ((y-or-n-p "Exit XEmacs? ")
	 (save-buffers-kill-emacs))))
(global-set-key "\C-x\C-c" 'my-exit-emacs)

;;;
;;; browse URLs using Netscape
;;;
(setq browse-url-browser-function 'browse-url-netscape)

;;;
;;; Autoload other major modes
(autoload 'antlr-mode "antlr-mode" nil t)
(autoload 'bparc-mode "bparc" nil t)
(autoload 'sawmill-mode "sawmill" "sawmill-mode" t)

;;;
;;; auto-mode-alist extentions:
;;;
;;; .cpp - C++
;;; .CC - C++
;;; .hh - C++
;;; .arc - bparc-mode
;;; .g 	- antlr-mode
;;;

(setq auto-mode-alist (cons '("\\.CC\\'" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.cc\\'" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.cpp\\'" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.hh\\'" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.y\\'" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.l\\'" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.arc\\'" . bparc-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.g\\'" . antlr-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.sawmillrc$" . sawmill-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.jl$" . sawmill-mode) auto-mode-alist))

(add-hook 'speedbar-load-hook  ; would be too late in antlr-mode.el
	       (lambda () (speedbar-add-supported-extension ".g")))

;;;
;;; no region highlighting like zmacs
;;;
(setq zmacs-regions nil)

;;;
;;; go into auto-fill mode when entering text mode
;;;
(setq text-mode-hook 'auto-fill-mode)

;;;
;;; print using enscript, to lja2
;;;
(setq lpr-command "nenscript")
(setq lpr-switches "-2r -Plp")

;;;
;;; XEmacs-dependent things:
;;;
;;;   - start gnuserv if running XEmacs
;;;   - reproduce Epoch keybindings under C-z
;;;
(cond
 ((and (string-match "XEmacs" emacs-version)
      (boundp 'emacs-major-version)
      (>= emacs-major-version 19))
  (progn
    (gnuserv-start)
    (global-unset-key "\C-z")
    (global-set-key "\C-zi" 'iconify-frame)
    (global-set-key "\C-z4\C-f" 'find-file-other-frame)
    (global-set-key "\C-z4b" 'switch-to-buffer-other-frame)
    (global-set-key "\C-z0" 'delete-frame)
    )
 ))

;;;
;;; key bindings
;;;

;; Emacs lisp mode
(define-key emacs-lisp-mode-map "\r" 'newline-and-indent)
(define-key emacs-lisp-mode-map "\t" 'self-insert-command)

;; C/C++ mode
(require 'cc-mode)

(define-key c++-mode-map "\r" 'newline-and-indent)
(define-key c++-mode-map "\t" 'self-insert-command)
(define-key c-mode-map "\r" 'newline-and-indent)
(define-key c-mode-map "\t" 'self-insert-command)
(define-key java-mode-map "\r" 'newline-and-indent)
(define-key java-mode-map "\t" 'self-insert-command)

(require 'antlr-mode)
(define-key antlr-mode-map "\r" 'newline-and-indent)
(define-key antlr-mode-map "\t" 'self-insert-command)

;; other bindings
(global-set-key "\C-l" 'goto-line)

;; keypad for page-up, page-down
(global-set-key [kp-home] 'beginning-of-buffer)
(global-set-key [kp-end] 'end-of-buffer)
(global-set-key [kp-begin] 'recenter)
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)

(setq minibuffer-max-depth nil)


(custom-set-variables
 '(user-mail-address "love@mcs.net" t)
 '(query-user-mail-address nil))
(custom-set-faces)

;; Options Menu Settings
;; =====================
(cond
 ((and (string-match "XEmacs" emacs-version)
       (boundp 'emacs-major-version)
       (or (and
            (= emacs-major-version 19)
            (>= emacs-minor-version 14))
           (= emacs-major-version 20))
       (fboundp 'load-options-file))
  (load-options-file "/home/love/.xemacs-options")))
;; ============================
;; End of Options Menu Settings
