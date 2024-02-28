
;;; inspired from https://github.com/abo-abo/ace-window

(defun get-visual ()
  (apply 'append
         (mapcar
          (lambda (f)
            (mapcar
             (lambda (w)
               (make-ace-obj w f))
             (window-list f)))
          (frame-list))))

(defun make-ace-obj (w f)
  (list (eq f (selected-frame))
        (eq w (selected-window))
        w
        (window-buffer w)))
(defun ace-current-frame-p (x) (car x)) 
(defun ace-current-window-p (x) (cadr x)) 
(defun ace-window (x) (caddr x)) 
(defun ace-buffer (x) (cadddr x)) 

(defun ace-swap-window! (window1 buffer1 window2 buffer2)
  (set-window-buffer window1 buffer2)
  (set-window-buffer window2 buffer1))

(defun ace-swap-window ()
  (interactive)
  (let ((w* (filter (get-visual) 'ace-current-frame-p)))
    (if (= 2 (length w*))
        (let ((current (car (filter w* 'ace-current-window-p)))
              (other (car (filter w* (lambda (w) (not (ace-current-window-p w)))))))
          (ace-swap-window! (ace-window current) (ace-buffer current)
                            (ace-window other)   (ace-buffer other)))
      (and (> (length w*) 1)
           (error "ace swap window: TODO for many windows [%s]" (length w*))))))

