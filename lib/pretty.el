

(defun make-pretty (syms)
 (and (is-x?)
      (progn (s! prettify-symbols-alist syms)
             (turn-on-prettify-symbols-mode))))

