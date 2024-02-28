
;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ BUFFER SWITCH
(defun filtered-buffer-list ()
  (filter
   (sort (mapcar 'buffer-name (buffer-list) )
         'string-lessp)
   (lambda (x)
     (not (or (member x
                      (mapcar 'buffer-name
                              (remove
                               (current-buffer)
                               (mapcar 'window-buffer
                                       (window-list) ) ) ) )
              (string-match "^\\([ ]\\|\\)[*]" x)
              (string-match "^TAGS" x)
              (member
               x
               '(
                 " SPEEDBAR"
                 ) ) ) ) ) ) )

(defvar s/buf/and/message
  (lambda(n)
    (let ((star "***")
          message-log-max
          (bl (filtered-buffer-list) ) )
      (let ((pos (- (abs n) ?1) ) )
        (and (< pos (length bl) )
             (setq
              star
              (prog1 "" (switch-to-buffer (nth pos bl) ) ) ) ) )
      (apply
       'message
       (cons
        (concat
         (apply
          'concat
          (mapcar (lambda (x) (concat x
                                 (if (> n 0) "[%s]" "%s")
                                 (make-string 10 ?\ ) ) )
                  bl) )
         star)
        (apply
         'append
         (mapcar
          (lambda (x) (cond ((and (> n 0) (= (- n ?0) x) )
                        '("#") )
                       ((and (< n 0) (= (- (- n) ?0) x) )
                        '("   < < <") )
                       ((> n 0)
                        (list (number-to-string x) ) )
                       (t
                        '("") ) ) )
          (number-sequence 1 (length bl) ) ) ) ) ) ) ) )
