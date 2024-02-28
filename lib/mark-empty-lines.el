
;;; Make colored markers in buffers,

(defun line-break-modified (overlay a b e &optional _)
  (and a
       (if (= ?\n (char-before))
           (move-overlay overlay (1+ b) (1+ e))
         (delete-overlay overlay))))

(defun mark-empty-line ()
  (interactive)
  (let ((oo (filter (overlays-at (point))
                    (lambda (x)
                      (eq 'page-break (overlay-get x 'name))))))
    (if oo
        ;; REMOVE LINE BREAK
        (mapcar 'delete-overlay oo)
      ;; INSERT LINE BREAK
      (let ((begin (line-beginning-position))
            (end (1+ (line-end-position))))
        (and (= end (1+ begin))
             (let ((color (completing-read "color " (defined-colors))))
               (let ((o (make-overlay begin end)))
                 (overlay-put o 'face `(:background ,color))
                 (overlay-put o 'display "\n")
                 ;; (overlay-put o 'insert-behind-hooks '(line-break-modified))
                 (overlay-put o 'insert-in-front-hooks '(line-break-modified))
                 (overlay-put o 'modification-hooks '(line-break-modified))
                 (overlay-put o 'name 'page-break))))))))


