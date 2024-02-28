

;; "Use C-c C-s  ----  c-show-syntactic-information to define style values."
;; (s!
;;  c-style
;;  ;; "C Style"
;;  `((c-recognize-knr-p . nil)
;;    ;; speed up indentation in XEmacs
;;    (c-enable-xemacs-performance-kludge-p . t)
;;    (c-basic-offset . 4)
;;    (indent-tabs-mode . nil)
;;    (c-comment-only-line-offset . 0)
;;    (c-hanging-braces-alist
;;     .
;;     ((defun-open after)
;;      (defun-close before after)
;;      (class-open after)
;;      (class-close before after)
;;      (namespace-open after)
;;      (inline-open after)
;;      (inline-close before after)
;;      (extern-lang-open after)
;;      (extern-lang-close after)
;;      (statement-case-open after)
;;      (substatement-open after)))
;;    (c-hanging-colons-alist
;;     .
;;     ((case-label)
;;      (label after)
;;      (access-label after)
;;      (member-init-intro before)
;;      (inher-intro)))
;;    (c-hanging-semi&comma-criteria
;;     .
;;     (c-semi&comma-no-newlines-for-oneline-inliners
;;      c-semi&comma-inside-parenlist
;;      c-semi&comma-no-newlines-before-nonblanks))
;;    (c-indent-comments-syntactically-p . nil)
;;    (comment-column . 40)
;;    (c-cleanup-list
;;     .
;;     (brace-else-brace
;;      brace-elseif-brace
;;      brace-catch-brace
;;      empty-defun-braces
;;      defun-close-semi
;;      list-close-comma
;;      scope-operator))
;;    (c-offsets-alist
;;     .
;;     (
;;      (access-label . 0)
;;      (annotation-top-cont . 4)
;;      (annotation-var-cont . 0)
;;      ;; The solo close paren of an argument list.
;;      (arglist-close . 0)
;;      ;; Subsequent argument list lines when no arguments follow on
;;      ;; the same line as the arglist opening paren.
;;      (arglist-cont c-lineup-gcc-asm-reg 0)
;;      ;; Subsequent argument list lines when at least one argument
;;      ;; follows on the same line as the arglist opening paren.
;;      (arglist-cont-nonempty c-lineup-gcc-asm-reg c-lineup-arglist)
;;      (arglist-intro . 4)
;;      (block-close . 0)
;;      (block-open . 0)
;;      ;; Subsequent lines in an enum or static array list where the
;;      ;; line begins with an open brace.
;;      (brace-entry-open . 4)
;;      ;; Close brace of an enum or static array list.
;;      (brace-list-close . 0)
;;      ;; Subsequent lines in an enum or static array list.
;;      (brace-list-entry . 0)
;;      ;; First line in an enum or static array list.
;;      (brace-list-intro . 4)
;;      ;; Open brace of an enum or static array list.
;;      (brace-list-open . 0)
;;      ;; Inside a multiline C style block comment.
;;      ;; (c . c-keep-expression-offset)
;;      (c . 1)
;;      (case-label . 0)
;;      (catch-clause . 0)
;;      ;; Brace that closes a class definition.
;;      (class-close . 0)
;;      ;; Brace that opens a class definition.
;;      (class-open . 0)
;;      (comment-intro . c-line-up-comment)
;;      (composition-close . 0)
;;      (composition-open . 3)
;;      ;; The first line inside a multiline preprocessor macro if
;;      ;; `c-syntactic-indentation-in-macros' is set.
;;      (cpp-define-intro . 4)
;;      ;; The start of a preprocessor macro definition.
;;      (cpp-macro . 0)
;;      ;;  All lines inside multiline preprocessor macros if
;;      ;; `c-syntactic-indentation-in-macros' is `nil'
;;      (cpp-macro-cont . 4)
;;      ;; The first line in a top-level defun.
;;      (defun-block-intro . 4)
;;      (defun-close . 0)
;;      (defun-open . 0)
;;      (do-while-closure . 0)
;;      (else-clause . 0)
;;      (extern-lang-close . 0)
;;      (extern-lang-open . 0)
;;      (friend . 0)
;;      (func-decl-cont . 4)
;;      ;; The line is nested inside a class definition.
;;      (inclass . 4)
;;      (incomposition . 0)
;;      ;;  A class definition inside an expression.  This is used for
;;      ;; anonymous classes in Java.  It's also used for anonymous
;;      ;; array initializers in Java.
;;      (inexpr-class . 0)
;;      (inexpr-statement . 0)
;;      (inextern-lang . 2)
;;      (inher-cont . 0)
;;      (inher-intro . 0)
;;      (inlambda . 0)
;;      (inline-close . 0)
;;      (inline-open . 0)
;;      (inmodule . 0)
;;      (innamespace . 0)
;;      (knr-argdecl . 0)
;;      (knr-argdecl-intro . 0)
;;      (label . 0)
;;      (lambda-intro-cont . 0)
;;      (member-init-cont . 0)
;;      (member-init-intro . 0)
;;      (module-close . 0)
;;      (module-open . 0)
;;      (namespace-close . 0)
;;      (namespace-open . 0)
;;      ;; A statement.
;;      (statement . 0)
;;      ;; The first line in a new statement block
;;      (statement-block-intro . 4)
;;      ;; The first line in a case block.
;;      (statement-case-intro . 4)
;;      ;; The first line in a case block that starts with a brace.
;;      (statement-case-open . 0)
;;      ;;  A continuation of a statement.
;;      (statement-cont . 0)
;;      (stream-op . 0)
;;      (string . 0)
;;      ;; The first line after a conditional or loop construct
;;      (substatement . 4)
;;      (substatement-label . 0)
;;      ;; The brace that opens a substatement block.
;;      (substatement-open . 2)
;;      (template-args-cont . 0)
;;      ;; The first line in a "topmost" definition.
;;      (topmost-intro . 0)
;;      (topmost-intro-cont . 0)
;;      ) ) ) )

;; (c-add-style "C" c-style t)


(c-set-style "gnu")

