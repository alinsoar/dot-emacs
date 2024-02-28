
(defun make-scratch ()
  "Get a scratch buffer for the current mode"
  (interactive)
  (let* ((mode major-mode)
         (mode/name (thread-last (symbol-name mode)
                      (replace-regexp-in-string "-mode$" "")))
         (count 0)
         (name (lambda () (format "*scratch/%s/%d*" mode/name count))))
    (while (get-buffer (funcall name))
      (setq count (1+ count)))
    (pop-to-buffer (funcall name))
    (funcall mode)
    (when comment-start
      (comment-dwim nil)
      (insert " -*- " mode/name " -*-"))
    (insert "\n\n")))







