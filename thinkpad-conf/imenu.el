
(defun sorting-function (a b)
  "sort by position"
  (let ((name1 (car a))
        (pos1 (cdr a))
        (name2 (car b))
        (pos2 (cdr b)))
    (< pos1 pos2)))

(s! imenu-auto-rescan t)
(s! imenu-sort-function 'sorting-function)
(s! imenu-max-items 40)
(s! imenu-max-item-length 40)

(local-set-key [(shift mouse-3)] 'imenu)

