%%------------------------------------------------------------------------------

-module({{module}}_sup).
-behaviour(supervisor).

%% API
-export([
         start_link/0
        ]).

%% supervisor callbacks
-export([
         init/1
        ]).

%% helper macros
-define(supervisor(I), {I, {I, start_link, []}, permanent, worker, supervisor, [I]}).
-define(server(I),     {I, {I, start_link, []}, permanent, 5000, worker, [I]}).

%%------------------------------------------------------------------------------
%% API
%%------------------------------------------------------------------------------

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%%------------------------------------------------------------------------------
%% supervisor callbacks
%%------------------------------------------------------------------------------

init([]) ->

  % one_for_one | rest_for_one | one_for_all | simple_one_for_one
  SupervisorStrategy = {
    _RestartStrategy = one_for_one,
    _MaxRestart      = 3,
    _MaxTime         = 60
   },

  {ok,{SupervisorStrategy, [?{{type}}({{module}}_srv)]}}.

%%------------------------------------------------------------------------------
