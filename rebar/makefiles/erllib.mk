##------------------------------------------------------------------------------

SHELL := bash
REBAR := $(shell which rebar)

##------------------------------------------------------------------------------
## common targets
##------------------------------------------------------------------------------

.PHONY: all clean distclean test dist

all: compile

clean:
	# cleaning project using rebar
	$(REBAR) clean

distclean: clean
	# removing uncommited changes
	git clean -fxd

test: eunit

dist:
	# TODO

##------------------------------------------------------------------------------
## custom targets
##------------------------------------------------------------------------------

.PHONY: compile deps eunit

compile: deps
	# compiling using rebar
	$(REBAR) -v compile

deps:
ifeq ($(wildcard deps),) 
	# getting deps
	$(REBAR) prepare-deps
else 
	# updating deps
	$(REBAR) refresh-deps
endif

eunit:
	# running eunit testcases
	$(REBAR) eunit

##------------------------------------------------------------------------------
