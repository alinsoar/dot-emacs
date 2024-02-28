
;;; eval-expression does not print the full answer for long answers by default
(setq eval-expression-print-level nil
      eval-expression-print-length nil
      print-level nil)

(fset 'yes-or-no-p 'y-or-n-p)

;;; catch error from the first occurence. this must not be edited.
(setq debug-on-error t)

;;; Enable debugger for messages and signals.
;; (setq debug-on-message t)
;; (setq debug-on-signal t)

;;; enable for all the modes
(set-default 'truncate-lines t)
(global-set-key "\C-c$" 'toggle-truncate-lines)
(global-set-key (kbd "<S-mouse-5>") (lambda () (interactive) (and truncate-lines (scroll-right 10))))
(global-set-key (kbd "<S-mouse-4>") (lambda () (interactive) (and truncate-lines (scroll-left 10))))
;;; todo: works as default but not in C buffers
(set-display-table-slot standard-display-table 'truncation ?>)

;; a "Open Recent" submenu is displayed in the "File" menu
(recentf-mode)

;;; disable it
(column-number-mode 1)

;; functions called to query before killing a buffer
(setq kill-buffer-query-functions nil)

;; typed text replaces the selection if the selection is active
(delete-selection-mode)

;;; move the cursor to other window using super-<direction> keys.
(windmove-default-keybindings 'super)
(setq-default windmove-wrap-around t)

;; lisp recursive processes
(setq max-specpdl-size 10000000
      max-lisp-eval-depth 1000000)

;; default mode for *scratch*
(setq initial-major-mode 'fundamental-mode)

(setq list-command-history-max 100000)

;;; Group the buffers by the major mode groups on <C-down-mouse-1>.
;;; TODO

(put 'narrow-to-region 'disabled nil)

;;; C-q <ASCII> RET inserts in HEXA -- C-q 21 RET => !
;; useful in case of some broken key on the keyboard
(setq read-quoted-char-radix #x10)
;; man ascii:
       ;;    2 3 4 5 6 7       30 40 50 60 70 80 90 100 110 120
       ;;  -------------      ---------------------------------
       ;; 0:   0 @ P ` p     0:    (  2  <  F  P  Z  d   n   x
       ;; 1: ! 1 A Q a q     1:    )  3  =  G  Q  [  e   o   y
       ;; 2: " 2 B R b r     2:    *  4  >  H  R  \  f   p   z
       ;; 3: # 3 C S c s     3: !  +  5  ?  I  S  ]  g   q   {
       ;; 4: $ 4 D T d t     4: "  ,  6  @  J  T  ^  h   r   |
       ;; 5: % 5 E U e u     5: #  -  7  A  K  U  _  i   s   }
       ;; 6: & 6 F V f v     6: $  .  8  B  L  V  `  j   t   ~
       ;; 7: ´ 7 G W g w     7: %  /  9  C  M  W  a  k   u  DEL
       ;; 8: ( 8 H X h x     8: &  0  :  D  N  X  b  l   v
       ;; 9: ) 9 I Y i y     9: ´  1  ;  E  O  Y  c  m   w
       ;; A: * : J Z j z
       ;; B: + ; K [ k {
       ;; C: , < L \ l |
       ;; D: - = M ] m }
       ;; E: . > N ^ n ~
       ;; F: / ? O _ o DEL

(setq message-log-max (expt 2 40))

;;; MODE LINE
(load-config 'mode-line)


;;; !!! IDO replaced by Vertical

;;; start IDO globally 

;; (setq ido-enable-flex-matching t
;;       ido-everywhere t
;;       ido-use-filename-at-point 'guess
;;       ido-use-url-at-point nil
;;       ido-create-new-buffer 'always     ; prompt always never
;;       ido-file-extensions-order  '(".org"
;;                                    ".txt"
;;                                    ".py"
;;                                    ".el"
;;                                    ".c")
;;       ;; Ignorance is Bliss
;;       ido-ignore-buffers '("\\` ")
;;       ido-ignore-directories '("\\`CVS/" "\\`\\.\\./" "\\`\\./")
;;       ido-ignore-files '("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./")
;;       ido-ignore-extensions t
;;       ido-auto-merge-delay-time 0.7
      
;;       )
;; (ido-mode 1)
;; (load-external 'ido-vertical-mode)
;; (ido-vertical-mode)

;; Toggle incremental minibuffer completion
(icomplete-mode)

;;; Vertical mode
(vertical-mode)

;; disable unuseful bars
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(fringe-mode nil)
(menu-bar-showhide-fringe-menu-customize-disable)
(set-or-toggle-mode-line -1)

;; disable initial message
(setq inhibit-splash-screen t)

(setq initial-scratch-message ())

;;; spaces instead of tabs by default.
(setq-default indent-tabs-mode nil)

;;; UPCASE
(put 'upcase-region 'disabled nil)

;;; grep

(load-config 'grep)

(and (eq system-type 'gnu/linux)
     (setenv "PATH"
             (concat
              "/usr/bin"
              (getenv "PATH"))))

;;; message-buffer
(define-key messages-buffer-mode-map
  [f12]
  (lambda ()
    (interactive)
    (let ((inhibit-read-only t))
      (erase-buffer) ) ) )

;;; true means, saving or writing a file silently puts a newline at the end
(setq mode-require-final-newline nil)
(setq require-final-newline nil)

;; change [f9] to the key you prefer to activate the ruler with.
(global-set-key [f9] 'column-ruler)

(defun column-ruler (width)
  "Display temp ruler at point."
  (interactive `(,(+ (window-hscroll)(window-width))))
  (momentary-string-display
   (let* ((iterations (/ (1- width) 10))
          (result1 "|...|....|")
          (result2 "1   5   10")
          (inc1 "....|....|")
          (inc2 "        %d0")
          (i 1))
     (while  (<= i iterations)
       (setq i (1+ i))
       (setq result1 (concat result1 inc1))
       (setq result2 (concat result2 (substring (format inc2 i) -10))))
     (concat (substring result2 0 width) "\n"
             (substring result1 0 width) "\n"))
   (line-beginning-position)
   nil "[space] Clears ruler"))

;; the init file should contain only one such instance --
;; if there is more than one, they won't work right.
(custom-set-variables
 '(safe-local-variable-values
   '((whitespace-line-column . 80)
     (keyword-style . none)
     )))

;;; make tiny width fringes
(setq-default left-fringe-width 1)
(setq-default right-fringe-width 0)

;;; A Git Porcelain inside Emacs

(load-external 'magit)

;;; TODO: auto-mode-alist

(add-to-list 'auto-mode-alist '("\\.info\\'" . Info-mode))

;;; speedbar inside frame

(global-set-key "\C-c\C-s" 'speedbar-inside-frame)

;;; Tab bar and line

(global-tab-line-mode 1)

(when (fboundp 'tab-bar-mode) (tab-bar-mode 1))

;;; trailing
(setq-default show-trailing-whitespace t)

;;; which buffers should appear in the "same" window
(add-to-list 'same-window-buffer-names "*SQL*")

;;; Haskell-mode
(load-external 'haskell)


;;; Smalltalk-mode
(load-external 'smalltalk)



