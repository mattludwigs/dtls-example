-module(dtls_client).
-export([connect/0, send/2, user_lookup/3]).

connect() ->
    {ok, Client} = ssl:connect({127, 0, 0, 1}, 4000, opts()),
    Client.

send(Client, Msg) ->
    ssl:send(Client, Msg).


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



