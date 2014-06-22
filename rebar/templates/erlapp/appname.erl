%%------------------------------------------------------------------------------
%% {{appname}} entry point
%%------------------------------------------------------------------------------

-module({{appname}}).

-export([
         start/0,
         start_link/0,
         stop/0
        ]).

%%------------------------------------------------------------------------------

start_link() ->
  {{appname}}_sup:start_link().

start() ->
  application:start({{appname}}).

stop() ->
  application:stop({{appname}}).

%%------------------------------------------------------------------------------