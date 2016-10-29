
;;;
;;; .emacs/init.el
;;;
;;; 
;;;
; true if we're under XEmacs (www.xemacs.org)
(setq version-xemacs    (string-match "XEmacs\\|Lucid" emacs-version))

; true if we're under regular emacs
(setq version-emacs     (not version-xemacs))

; true if we're running under anything other than a text terminal
(setq version-not-term  (not (not window-system)))

; true under regular emacs and X windows
(setq version-emacs-x   (and (not version-xemacs) (equal window-system 'x)))

(setq visible-bell t)

; ---------------- portable mark functions ---------------
(defun is-mark-active ()
  "True if the selection is displayed."
  (cond
    (version-emacs
      mark-active)           ; (mark) causes error if inactive under regular emacs
    (version-xemacs
      (not (not (mark))))    ; but nil with xemacs, and mark-active doesn't exist
    (t t)
  ))



;; enable ESC-ESC
(put 'eval-expression 'disabled nil)
;; find my elisp code
(setq load-path (cons "~/elisp" load-path))
;(setq load-path (cons "~/elisp/vc" load-path))
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
;;; Autoload other major modes
;;;
(require 'vc)
(require 'font-lock)
(require 'mercurial)
(require 'cmake-mode)
(require 'yaml-mode)
(require 'protobuf-mode)

(add-to-list 'vc-handled-backends 'SVN)
(add-to-list 'vc-handled-backends 'GIT)
;;;
;;; C mode common hook
;;;
(defun my-c-mode-common-hook()
  (setq tab-width 4)
  (setq indent-tabs-mode nil)

  (setq c-basic-offset 4)
)


(require 'go-mode-autoloads)

;;;
;;; auto-mode-alist extentions:
;;;
;;; .cpp - C++
;;; .CC - C++
;;; .hh - C++
;;; .cu - C++
;;;

(setq auto-mode-alist (cons '("\\.CC\\'" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.cc\\'" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.cpp\\'" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.hh\\'" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.y\\'" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.l\\'" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.proto\\'" . protobuf-mode) auto-mode-alist))
(setq auto-mode-alist
        (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                  ("\\.cmake\\'" . cmake-mode))
                auto-mode-alist))
(setq auto-mode-alist (cons '("\\.go\\'" . go-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.template\\'" . yaml-mode) auto-mode-alist))
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
(setq c-mode-common-hook 'my-c-mode-common-hook)
(require 'cc-mode)
(require 'cuda-mode)

;;
;;(define-key c++-mode-map "[" 'self-insert-command)
(load-file "~/elisp/clang-format.el")
(define-key c++-mode-map (kbd "<C-tab>") 'clang-format-region)

(define-key c++-mode-map "\r" 'newline-and-indent)
(define-key c++-mode-map "\t" 'self-insert-command)
(define-key c-mode-map "\r" 'newline-and-indent)
(define-key c-mode-map "\t" 'self-insert-command)
(define-key java-mode-map "\r" 'newline-and-indent)
(define-key java-mode-map "\t" 'self-insert-command)
;(define-key go-mode-map "\r" 'newline-and-indent)
(define-key yaml-mode-map "\r" 'newline-and-indent)
(define-key protobuf-mode-map "\r" 'newline-and-indent)
(define-key protobuf-mode-map "\t" 'self-insert-command)

;; other bindings
(global-set-key "\C-l" 'goto-line)

;; keypad for page-up, page-down
(global-set-key [kp-home] 'beginning-of-buffer)
(global-set-key [kp-end] 'end-of-buffer)
(global-set-key [kp-begin] 'recenter)
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
(global-set-key [button5] 'scroll-up)
(global-set-key [button4] 'scroll-down)

(setq minibuffer-max-depth nil)


(custom-set-variables
 '(user-mail-address "cjlove@san.rr.com" t)
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
  (load-options-file "/extra/home/love/.xemacs-options")))
;; ============================
;; End of Options Menu Settings
