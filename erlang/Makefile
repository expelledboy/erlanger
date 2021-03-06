##------------------------------------------------------------------------------

SHELL := bash
ERLANGER ?= $(HOME)/erlanger
ERLANG_OPT := $(ERLANGER)/opt/erlang
ERLANG_BINS := dialyzer epmd erl erlc escript typer
ERLANG_DIRS := $(foreach d,archives build versions,$(ERLANG_OPT)/$d)
ERLANG_VSNS := $(foreach v,R16B R13B04, $(ERLANG_OPT)/versions/$v)
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

build-latest: R16B

R16B: $(HOME)/.kerlrc $(ERLANG_OPT)/versions/R16B
	# linking binaries to current erlang version
	ln -fhs $(ERLANG_OPT)/versions/$@ $(ERLANG_OPT)/versions/current

R13B04: $(HOME)/.kerlrc $(ERLANG_OPT)/versions/R13B04
	# linking binaries to current erlang version
	ln -fhs $(ERLANG_OPT)/versions/$@ $(ERLANG_OPT)/versions/current

##------------------------------------------------------------------------------

$(ERLANG_DIRS):
	mkdir -p $@

$(ERLANG_LINKS):
	ln -s $(ERLANG_OPT)/versions/current/bin/$(shell basename $@) $@

$(ERLANG_VSNS):
	kerl build $(shell basename $@) $(shell basename $@)
	kerl install $(shell basename $@)
	mkdir $@/packages

##------------------------------------------------------------------------------
