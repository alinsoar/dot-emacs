# dot-emacs
This is my `.emacs` configuration.

Load this configuation by inserting in `.emacs` only this:

    (load "/PATH-TO-DOT-EMACS-CONFIGURATION-DIRECTORY/emacs-init.el")

Each major or minor mode uses a lazy configuration that is loaded when
the mode is activated.  There are global configurations, that are
loaded only when emacs starts and global configurations that are
loaded only when a major mode starts for the first time.  But most of
the configurations are loaded each time when a mode is activated, for
example, after having opened a file, its associated buffer is switched
to a given mode.

The `extern` directory contains code that was imported from either
elpa or melpa.  For example, magit.  Apart from that, everything was
written by me.  This directory can be eliminated, but in case of
updates of external packages some of the local configurations may not
work any longer.  So, to keep the configurations more stable, I
prefered to keep a local copy.  Even so, some emacs lisp features can
become outdated and local and external packages may require an update,
but this happens rarely.

The `lib` directory contains modules with various functionalities.

The `main` directory contains functions that are used when emacs
starts.

The `themes` directory contains theme definitions that are used as
scripts for the theme module from `./lib/color-theme.el`.  I mainly
used the light theme, the dark theme only in python.

The `thinkpad-conf` contains configuration that are loaded from hooks.
Note that a hook can load many configurations and there are many mode
hooks that can load the same configuration.  For example, I loaded
lisp.el when worked with common lisp, emacs lisp, scheme.




