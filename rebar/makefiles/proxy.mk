##------------------------------------------------------------------------------

-include env.mk

ERLANGER ?= $(HOME)/erlanger
MAKEFILE ?= $(ERLANGER)/opt/rebar/makefile/erlapp.mk

-include $(MAKEFILE)

##------------------------------------------------------------------------------
