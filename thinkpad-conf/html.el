
(set (make-local-variable 'sgml-basic-offset) 4)

(define-key html-mode-map [(control meta f)] 'sgml-skip-tag-forward)
(define-key html-mode-map [(control meta b)] 'sgml-skip-tag-backward)

