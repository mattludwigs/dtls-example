-module(dtls_server).
-behaviour(gen_server).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, user_lookup/3, start_link/0]).

start_link() ->
    application:ensure_all_started(ssl),
    gen_server:start_link(?MODULE, [], []).

init([]) ->
    self() ! {listen, 4000},
    {ok, []}.

handle_call(_, _From, State) ->
    {reply, State, State}.

handle_cast(_, State) ->
    {noreply, State}.

handle_info({listen, Port}, State) ->
    listen(Port),
    {noreply, State};
handle_info(Msg, State) ->
    io:format("[Server Recv]: ~p~n", [Msg]),
    {noreply, State}.

%%% Private Functions %%%

listen(Port) ->
    {ok, ListenSocket} = ssl:listen(Port, opts()),
    {ok, TransportAcceptSock} = ssl:transport_accept(ListenSocket),
    ssl:ssl_accept(TransportAcceptSock),
    ssl:recv(TransportAcceptSock, 0),
    TransportAcceptSock.

user_lookup(psk, _Username, UserState) ->
    {ok, UserState}.

opts() ->
    [
     {ssl_imp, new},
     {active, true},
     {verify, verify_none},
     {versions, [dtlsv1]},
     {protocol, dtls},
     {ciphers, [{psk, aes_128_cbc, sha}]},
     {psk_identity, "Client_identity"},
     {user_lookup_fun,
      {fun user_lookup/3,
       <<16#12, 16#34, 16#56, 16#78, 16#90, 16#12, 16#34, 16#56, 16#78, 16#90, 16#12, 16#34, 16#56, 16#78,
         16#90, 16#AA>>}},
     {cb_info, {gen_udp, udp, udp_close, udp_error}}
    ].



