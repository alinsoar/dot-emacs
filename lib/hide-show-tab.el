
(require 'hideshow)

(defun tab-hs-hide ( &optional arg )
"Called once on a line that contains a hidden block, displays
 the block.

 Called once on a line that does not contain a hidden blick,
 calls the default action of TAB with the given universal
 argument.

 Called twice on a line that does not contain a hidden block, the
 first time calls the default action of TAB, and the second time
 hides the block from the position of the point."
  (interactive "P")
  (let ((sl (save-excursion (move-beginning-of-line nil) (point) ) )
        (el (save-excursion (move-end-of-line nil) (point) ) )
        obj)
    (catch 'stop
      (dotimes (i (- el sl))
        (mapc
         (lambda (overlay)
           (when (eq 'hs (overlay-get overlay 'invisible))
             (setq obj t)))
         (overlays-at (+ i sl)))
        (and obj (throw 'stop 'stop) ) ) )
    (cond ((and (null obj)
                (eq last-command this-command) )
           (hs-hide-block) )
          (obj
           (progn
             (move-beginning-of-line nil)
             (hs-show-block) ) )
          (t
           (funcall (lookup-key (current-global-map) (kbd "^I") ) arg ) ) ) ) )

