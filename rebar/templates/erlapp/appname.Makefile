##------------------------------------------------------------------------------

SHELL := bash
PLT_APPS ?= erts kernel stdlib
PLT := dialyzer.plt
REBAR := $(shell which rebar)

##------------------------------------------------------------------------------
## common targets
##------------------------------------------------------------------------------

.PHONY: all clean distclean test dist

ifeq ($(wildcard deps),)
all: build
else
all: compile
endif

clean:
	# cleaning project using rebar
	$(REBAR) clean

distclean: .git
	git clean -n -xd
	# Are you sure? ^C to cancel
	sleep 5
	# removing uncommited changes
	git clean -f -xd

test: eunit

dist:
	# https://github.com/basho/node_package

##------------------------------------------------------------------------------
## custom targets
##------------------------------------------------------------------------------

.PHONY: build rebuild compile lock eunit typer dialyzer

build: .git deps deps/sync

rebuild:
	# updating deps
	$(REBAR) refresh-deps
	$(MAKE) compile

init:
	git init
	git add -A
	git add -f node/*

compile: deps .git
	# compiling using rebar
	$(REBAR) skip_deps=true compile

lock: .git
	# generating and symlinking rebar.config.lock file
	$(REBAR) rebar lock-deps
	ln -fhs rebar.config.lock rebar.config
	git add rebar.config rebar.config.lock

eunit:
	# running eunit testcases
	$(REBAR) eunit

typer: $(PLT)
	@echo "$(INFO) Running typer on src"
	typer --plt $(PLT) -r ./src

dialyzer: $(PLT) compile
	# running dialyzer on ebin
	@dialyzer --fullpath --plt $(PLT) -r ./ebin -Wrace_conditions

##------------------------------------------------------------------------------
## real targets
##------------------------------------------------------------------------------

deps/sync:
	git clone git://github.com/rustyio/sync.git deps/sync
	make -C deps/sync

$(PLT): deps
	# building local dialyzer plt from $(PLT_APPS)
	dialyzer --output_plt $@ --build_plt --apps $(PLT_APPS) -r deps

deps:
	# getting deps
	$(REBAR) get-deps
	$(REBAR) compile

.git:
	# checking for git repo
	[ -d .git ]

##------------------------------------------------------------------------------
