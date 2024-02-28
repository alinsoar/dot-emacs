
(defconst resize--window-area-percent 35)

(defun resize--which-window-side (position window)
  (let* ((w/height (window-pixel-height window))
         (w/width (window-pixel-width window))
         (percent (lambda (a total) (truncate (/ (* a 100.0) total)))))
    (pcase (posn-x-y position)
      (`(,left . ,top)
       (let* ((right (- w/width left))
              (bottom (- w/height top))
              (percent
               (sort `( (,(funcall percent top w/height) TOP)
                        (,(funcall percent bottom w/height) BOTTOM)
                        (,(funcall percent left w/width) LEFT)
                        (,(funcall percent right w/width) RIGHT))
                     (lambda (a b)
                       (< (car a) (car b))))))
         (and (<= (caar percent) resize--window-area-percent)
              (> (caadr percent) resize--window-area-percent)
              (cadar percent)))))))

(defun resize--which-window (position window)
  (let ((side (resize--which-window-side position window)))
    (cons side
          (pcase side
            (`RIGHT (and (window-in-direction 'right window t)
                         window))
            (`LEFT (window-in-direction 'left window t))
            (`TOP (window-in-direction 'above window t))
            (`BOTTOM (and (window-in-direction 'below window t)
                          window))))))

(defun resize--do (event direction)
  (let* ((position (event-start event))
         (mouse/position/window (posn-window position))
         (where (resize--which-window position mouse/position/window))
         (side (car where))
         (move/window (cdr where)))
    (and side move/window       ; frame's border sides cannot be moved
         (let ((delta/h (* direction (window--size-to-pixel move/window 1 t)))
               (delta/v (* direction (window--size-to-pixel move/window 1 nil))))
           (apply 'adjust-window-trailing-edge 
                  `(,move/window
                    ,@(pcase side
                        (`LEFT   `(,(- delta/h) t t))
                        (`RIGHT  `(,delta/h t t))
                        (`TOP    `(,(- delta/v) nil t))
                        (`BOTTOM `(,delta/v nil t)))))))))

(defun resize--try-grow (event)
  (interactive "e")
  (resize--do event -1))

(defun resize--try-shrink (event)
  (interactive "e")
  (resize--do event 1))




