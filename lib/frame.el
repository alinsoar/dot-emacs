

;;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Cursor-Display.html


;;; t               use the cursor specified for the frame
;;; nil             don’t display a cursor
;;; box             display a filled box cursor
;;; hollow          display a hollow box cursor
;;; bar             display a vertical bar cursor with default width
;;; (bar . WIDTH)   display a vertical bar cursor with width WIDTH
;;; hbar            display a horizontal bar cursor with default height
;;; (hbar . HEIGHT) display a horizontal bar cursor with height HEIGHT
;;; ANYTHING ELSE   display a hollow box cursor
(defun frame:set-cursor-type (type &optional non-selected)
  (setq-local cursor-type type)
  (setq-local cursor-in-non-selected-windows non-selected))

(defun frame:set-cursor-no-blink ()
  (s! blink-cursor-alist (quote ((nil))))
  (blink-cursor-mode 0))

(defun frame:set-cursor-color (color)
  (s! cursor-color color)
  (add-hook
   'buffer-list-update-hook
   (lambda ()
     (set-cursor-color cursor-color))
   0
   'local))

;; TODO

;; (s! blink-cursor-alist (quote ((nil))))
;; (s! blink-cursor-delay 10)
;; (s! blink-cursor-interval 1)
;; (s! display-hourglass nil)
;; (s! hourglass-delay 1)
;; (s! visible-cursor t)
;; (s! x-stretch-cursor t) ; Non-nil means draw block cursor as wide as the glyph under it.
;; ;;; `arrow',`text', `hand', `vdrag', `hdrag', `modeline', `hourglass'.
;; (s! void-text-area-pointer (quote hand))


(defmacro push-cursor-color (var c-color)
  `(let ((c (frame-parameter nil 'cursor-color)))
     (or (boundp (quote ,var))
         (s! ,var ()))
     (push c ,var)
     (set-cursor-color ,c-color)))

(defmacro pop-cursor-color (var)
  `(progn
     (let ((c (pop ,var)))
       (set-cursor-color c))
     (or ,var (makunbound (quote ,var)))))
