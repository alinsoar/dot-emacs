
ELCFILES := $(patsubst %.el,%.elc,$(wildcard *.el))
EMACS=emacs

$(info ${ELCFILES})

all:
	@:

.PHONY: compile
compile: $(ELCFILES)

$(ELCFILES): %.elc: %.el
	$(EMACS) --batch -Q -L . -f batch-byte-compile $<

clean:
	rm -rf *.elc
