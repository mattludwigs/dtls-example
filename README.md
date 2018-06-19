# DtlsProto


## Build and Run

- `erl -make`
- `erl -pa ebin/`

```erlang
Erlang/OTP 20 [erts-9.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:10] [hipe] [kernel-poll:false]

Eshell V9.2  (abort with ^G)
1> dtls_server:start_link().
{ok,<0.81.0>}
2> Client = dtls_client:connect().
{sslsocket,{gen_udp,#Port<0.936>,dtls_connection},<0.85.0>}
3> dtls_client:send(Client, "Hello").
ok
[Server Recv]: {ssl,
                   {sslsocket,
                       {gen_udp,
                           {<0.84.0>,{{{127,0,0,1},64655},#Port<0.933>}},
                           dtls_connection},
                       <0.86.0>},
                   "Hello"}
4>
```


Example DTLS with PSK in Erlang. Just a proof of concept. Does not work with Erlang/OTP >= 20.3.


