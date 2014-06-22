##------------------------------------------------------------------------------

SHELL := bash
ERLANGER ?= $(HOME)/erlanger

##------------------------------------------------------------------------------

.PHONY: all install uninstall

all: install
	-@echo && exec $(ERLANGER)/bin/kerl

install: $(HOME)/.kerlrc $(ERLANGER)/bin/kerl

uninstall:
	rm -f $(HOME)/.kerlrc $(ERLANGER)/bin/kerl

##------------------------------------------------------------------------------

$(HOME)/.kerlrc:
	# installing kerl configuration file 
	ln -s $(PWD)/.kerlrc $(HOME)/.kerlrc

$(ERLANGER)/bin/kerl:
	# installing kerl command 
	curl -O 'https://raw.githubusercontent.com/spawngrid/kerl/master/kerl'
	chmod a+x kerl
	mv kerl $(ERLANGER)/bin

##------------------------------------------------------------------------------
