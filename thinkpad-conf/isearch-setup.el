
(let ((isearch-mode-values
       '(
         (isearch-allow-scroll t)
         (isearch-hide-immediately t)
         (isearch-lazy-highlight t)
         (isearch-resume-in-command-history t)
         (regexp-search-ring-max 1000)
         (search-exit-option t)
         (search-highlight t)
         (search-invisible nil)
         (search-nonincremental-instead t)
         (search-ring-max 10000)
         (search-ring-update t)
         (search-slow-speed 1200)
         (search-slow-window-lines 2)
         (search-upper-case (quote not-yanks))
         (search-whitespace-regexp "\\s-+")
         (isearch-lazy-highlight t)

         ;; show match count
         (isearch-lazy-count t)
         (lazy-count-suffix-format " {%s / %s}")
         (lazy-count-prefix-format "")
         )))

  (dolist (x isearch-mode-values)
    (set (make-local-variable (car x)) (cadr x))))

;; todo -- default color for
;; M-s h l --- highlight-lines-matching-regexp

;;; (push-cursor isearch-cursor-stack '(bar . 1) "magenta")



;; (add-hook 'isearch-update-post-hook 'isearch-display-count-matches 'end t)

(load-theme 'isearch)

