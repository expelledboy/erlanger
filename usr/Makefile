##------------------------------------------------------------------------------

NAME ?= myapp

##------------------------------------------------------------------------------

.PHONY: all

all: usage

##------------------------------------------------------------------------------

.PHONY: usage app lib

usage:
	# make app NAME=erlanger
	# make lib NAME=erlanger

app:
	rebar create template=erlapp appname=$(NAME)

lib:
	rebar create template=erllib libname=$(NAME)

##------------------------------------------------------------------------------
