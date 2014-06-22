##------------------------------------------------------------------------------

SHELL := bash
ERLANGER ?= $(HOME)/erlanger
ERLANG_OPT := $(ERLANGER)/opt/erlang
ERLANG_BINS := dialyzer epmd erl erlc escript typer
ERLANG_DIRS := $(foreach d,archives build versions,$(ERLANG_OPT)/$d)
ERLANG_VSNS := $(foreach v,r16b, $(ERLANG_OPT)/versions/$v)
ERLANG_LINKS := $(ERLANG_BINS:%=$(ERLANGER)/bin/%)

##------------------------------------------------------------------------------

.PHONY: all install uninstall

all: install

install: $(ERLANG_DIRS) $(ERLANG_LINKS) build-latest

uninstall:
	rm -rf $(ERLANG_OPT)
	rm -rf $(ERLANG_LINKS)
	rm -rf $(HOME)/.kerl

##------------------------------------------------------------------------------

.PHONY: build-latest r16b

build-latest: r16b

r16b: $(HOME)/.kerlrc $(ERLANG_OPT)/versions/r16b
	# linking binaries to current erlang version
	ln -fhs $(ERLANG_OPT)/versions/$@ $(ERLANG_OPT)/versions/current

##------------------------------------------------------------------------------

$(ERLANG_DIRS):
	mkdir -p $@

$(ERLANG_LINKS):
	ln -s $(ERLANG_OPT)/versions/current/bin/$$(basename $@) $@

$(ERLANG_VSNS):
	kerl build $$(basename $@) $$(basename $@)
	kerl install $$(basename $@)

##------------------------------------------------------------------------------
