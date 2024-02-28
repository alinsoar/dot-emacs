
(message "Emacs loaded in %s."
         (format-time-string "%s seconds %3N milliseconds"
                             (time-subtract
                              after-init-time
                              before-init-time)))


