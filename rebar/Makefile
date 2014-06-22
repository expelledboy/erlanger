##------------------------------------------------------------------------------

SHELL = bash
ERLANGER ?= $(HOME)/erlanger

##------------------------------------------------------------------------------

.PHONY: all install uninstall

all: install

install: $(ERLANGER)/bin/rebar $(HOME)/.rebar/templates

uninstall:
	# deleting executable
	rm -f $(ERLANGER)/bin/rebar
	# deleting sym link to templates
	unlink $(HOME)/.rebar/templates

##------------------------------------------------------------------------------

$(ERLANGER)/bin/rebar:
	# installing latest build of rebar executable
	mkdir -p $(HOME)/.rebar
	curl -O 'https://raw.githubusercontent.com/wiki/rebar/rebar/rebar'
	chmod a+x rebar
	mv rebar $@

$(HOME)/.rebar/templates: $(ERLANGER)/bin/rebar
	# installing templates
	ln -s $(PWD)/templates ~/.rebar/templates

##------------------------------------------------------------------------------
