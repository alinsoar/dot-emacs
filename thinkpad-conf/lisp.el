
;;; Interface included by all lisp-modes

(local-set-key [(meta ? )]
               (lambda (&optional arg)
                 (interactive "p")
                 (just-one-space (if (= 4 arg) 1 (- arg)))))

(local-set-key [(control ?x) ?\\]
               (lambda (&optional x)
                 "Insert λ at point.  With prefix, inserts (λ ())."
                 (interactive "P")
                 (if x
                     (insert "lambda")
                   (insert "(lambda ())")
                   (backward-char 2))))

(local-set-key [(meta ? )]
               (lambda (&optional arg)
                 (interactive "p")
                 (just-one-space (if (= 4 arg) 1 (- arg)))))

(local-set-key [(control ?x) ?\\]
               (lambda (&optional x)
                 "Insert λ at point.  With prefix, inserts (λ ())."
                 (interactive "P")
                 (if x
                     (insert "lambda")
                   (insert "(lambda ())")
                   (backward-char 2))))

