# dot-emacs
This is my .emacs configuration.

Load this configuation by inserting in `.emacs` only this:

    (load "/PATH-TO-DOT-EMACS-CONFIGURATION-DIRECTORY/emacs-init.el")

Each major or minor mode uses a lazy configuration that is loaded when
the major mode is activated.  There are global configurations, that
are loaded only when emacs starts and global configurations that are
loaded only when a major mode starts for the first time.

The `extern` directory contains code that was imported from either
elpa or melpa.  Apart from that, everything was written by me.

The `lib` directory contains modules with various functionalities.

The `main` directory contains functions that are used when emacs
starts.

The `themes` directory contains theme definitions that are used as
scripts for the theme module from ./lib/color-theme.el.  I used the
light theme, I used the dark theme only in python.

The `thinkpad-conf` contains configuration that are loaded from hooks.
Note that a hook can load many configurations and there are many modes
that can load the same configuration.  For example, I loaded lisp.el
when worked with common lisp, emacs lisp, scheme.




