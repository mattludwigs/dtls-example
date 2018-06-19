# DtlsProto


## Build and Run

- `erl -make`
- `erl -pa ebin/`


# Working like this on Erlang/OTP <= 20.2.4

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

# There seems to be a regression starting at Erlang/OTP 20.3

```
Erlang/OTP 20 [erts-9.3] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:10] [hipe] [kernel-poll:false]

Eshell V9.3  (abort with ^G)
1> dtls_server:start_link().         
{ok,<0.81.0>}
2> Client = dtls_client:connect().   

=ERROR REPORT==== 19-Jun-2018::15:25:24 ===
** State machine <0.86.0> terminating
** Last event = {internal,
                    {client_hello,
                        {254,255},
                        <<91,41,130,211,124,91,38,102,66,231,76,27,43,210,205,
                          118,211,78,25,37,177,52,12,123,116,64,22,55,44,86,
                          102,100>>,
                        <<>>,
                        <<86,18,108,113,78,236,230,56,65,27,204,119,145,92,85,
                          225,26,165,144,105>>,
                        [<<0,255>>,<<0,140>>],
                        <<0>>,
                        {hello_extensions,undefined,undefined,undefined,
                            undefined,undefined,undefined,undefined,
                            undefined}}}
** When server state  = [{data,
                          [{"State",
                            {hello,
                             {state,server,
                              {#Ref<0.494330490.2950692871.175340>,<0.81.0>},
                              gen_udp,dtls_connection,udp,udp_closed,
                              udp_error,"localhost",4000,
                              {<0.84.0>,{{{127,0,0,1},49957},#Port<0.933>}},
                              {ssl_options,dtls,
                               [{254,255}],
                               verify_none,
                               {#Fun<ssl.8.17007857>,[]},
                               #Fun<ssl.9.17007857>,false,false,undefined,1,
                               <<>>,"***",<<>>,"***","***","***",<<>>,"***",
                               undefined,
                               {#Fun<dtls_server.0.66494961>,
                                <<18,52,86,120,144,18,52,86,120,144,18,52,86,
                                  120,144,170>>},
                               "***","***",
                               [<<0,140>>],
                               #Fun<ssl.2.17007857>,true,268435456,false,true,
                               infinity,false,undefined,undefined,undefined,
                               undefined,true,undefined,[],undefined,false,
                               true,one_n_minus_one,undefined,false,
                               {ssl_crl_cache,{internal,[]}},
                               undefined,
                               {elliptic_curves,
                                [{1,3,132,0,39},
                                 {1,3,132,0,38},
                                 {1,3,132,0,35},
                                 {1,3,36,3,3,2,8,1,1,13},
                                 {1,3,132,0,36},
                                 {1,3,132,0,37},
                                 {1,3,36,3,3,2,8,1,1,11},
                                 {1,3,132,0,34},
                                 {1,3,132,0,16},
                                 {1,3,132,0,17},
                                 {1,3,36,3,3,2,8,1,1,7},
                                 {1,3,132,0,10},
                                 {1,2,840,10045,3,1,7},
                                 {1,3,132,0,3},
                                 {1,3,132,0,26},
                                 {1,3,132,0,27},
                                 {1,3,132,0,32},
                                 {1,3,132,0,33},
                                 {1,3,132,0,24},
                                 {1,3,132,0,25},
                                 {1,3,132,0,31},
                                 {1,2,840,10045,3,1,1},
                                 {1,3,132,0,1},
                                 {1,3,132,0,2},
                                 {1,3,132,0,15},
                                 {1,3,132,0,9},
                                 {1,3,132,0,8},
                                 {1,3,132,0,30}]},
                               false,false,262144},
                              {socket_options,list,0,0,0,true},
                              "***","***",0,"***",
                              #Ref<0.494330490.2950823943.175228>,"***",
                              #Ref<0.494330490.2950823943.175237>,
                              ssl_session_cache,
                              {ssl_crl_cache,
                               {{#Ref<0.494330490.2950823943.175231>,
                                 #Ref<0.494330490.2950823943.175232>},
                                []}},
                              {254,255},
                              undefined,false,undefined,
                              {undefined,undefined},
                              undefined,undefined,"***","***","***",undefined,
                              "***","***","***",
                              {#Ref<0.494330490.2950823943.175229>,
                               #Ref<0.494330490.2950823943.175230>},
                              #Ref<0.494330490.2950692871.175343>,undefined,
                              "***",
                              {false,first},
                              {<0.81.0>,#Ref<0.494330490.2950692871.175344>},
                              undefined,false,true,false,false,undefined,
                              undefined,undefined,undefined,undefined,"***",
                              {retransmit,1000},
                              #{current_cookie_secret =>
                                 <<225,27,239,135,49,254,221,13,59,32,29,82,
                                   216,112,218,32,135,31,43,210,10,71,84,137,
                                   235,230,0,6,44,200,101,68>>,
                                ignored_alerts => 0,max_ignored_alerts => 10,
                                previous_cookie_secret => <<>>}}}}]}]
** Reason for termination = error:function_clause
** Callback mode = [state_functions,state_enter]
** Stacktrace =
**  [{public_key,pkix_decode_cert,
                 [undefined,otp],
                 [{file,"public_key.erl"},{line,288}]},
     {ssl_handshake,select_hashsign,5,
                    [{file,"ssl_handshake.erl"},{line,1058}]},
     {dtls_handshake,handle_client_hello,5,
                     [{file,"dtls_handshake.erl"},{line,196}]},
     {dtls_connection,handle_client_hello,2,
                      [{file,"dtls_connection.erl"},{line,812}]},
     {gen_statem,call_state_function,5,[{file,"gen_statem.erl"},{line,1633}]},
     {gen_statem,loop_event_state_function,6,
                 [{file,"gen_statem.erl"},{line,1023}]},
     {dtls_connection,init,1,[{file,"dtls_connection.erl"},{line,98}]},
     {proc_lib,init_p_do_apply,3,[{file,"proc_lib.erl"},{line,247}]}]
** exception exit: {{function_clause,[{public_key,pkix_decode_cert,
                                                  [undefined,otp],
                                                  [{file,"public_key.erl"},{line,288}]},
                                      {ssl_handshake,select_hashsign,5,
                                                     [{file,"ssl_handshake.erl"},{line,1058}]},
                                      {dtls_handshake,handle_client_hello,5,
                                                      [{file,"dtls_handshake.erl"},{line,196}]},
                                      {dtls_connection,handle_client_hello,2,
                                                       [{file,"dtls_connection.erl"},{line,812}]},
                                      {gen_statem,call_state_function,5,
                                                  [{file,"gen_statem.erl"},{line,1633}]},
                                      {gen_statem,loop_event_state_function,6,
                                                  [{file,"gen_statem.erl"},{line,1023}]},
                                      {dtls_connection,init,1,
                                                       [{file,"dtls_connection.erl"},{line,98}]},
                                      {proc_lib,init_p_do_apply,3,
                                                [{file,"proc_lib.erl"},{line,247}]}]},
                    {gen_statem,call,[<0.86.0>,{start,infinity},infinity]}}

=ERROR REPORT==== 19-Jun-2018::15:25:24 ===
** Generic server <0.81.0> terminating 
** Last message in was {listen,4000}
** When Server state == []
** Reason for termination == 
** {{{function_clause,
         [{public_key,pkix_decode_cert,
              [undefined,otp],
              [{file,"public_key.erl"},{line,288}]},
          {ssl_handshake,select_hashsign,5,
              [{file,"ssl_handshake.erl"},{line,1058}]},
          {dtls_handshake,handle_client_hello,5,
              [{file,"dtls_handshake.erl"},{line,196}]},
          {dtls_connection,handle_client_hello,2,
              [{file,"dtls_connection.erl"},{line,812}]},
          {gen_statem,call_state_function,5,
              [{file,"gen_statem.erl"},{line,1633}]},
          {gen_statem,loop_event_state_function,6,
              [{file,"gen_statem.erl"},{line,1023}]},
          {dtls_connection,init,1,[{file,"dtls_connection.erl"},{line,98}]},
          {proc_lib,init_p_do_apply,3,[{file,"proc_lib.erl"},{line,247}]}]},
     {gen_statem,call,[<0.86.0>,{start,infinity},infinity]}},
    [{gen,do_call,4,[{file,"gen.erl"},{line,177}]},
     {gen_statem,call_dirty,4,[{file,"gen_statem.erl"},{line,591}]},
     {ssl_connection,call,2,[{file,"ssl_connection.erl"},{line,1945}]},
     {ssl_connection,handshake,2,[{file,"ssl_connection.erl"},{line,115}]},
     {dtls_server,listen,1,[{file,"src/dtls_server.erl"},{line,31}]},
     {dtls_server,handle_info,2,[{file,"src/dtls_server.erl"},{line,20}]},
     {gen_server,try_dispatch,4,[{file,"gen_server.erl"},{line,616}]},
     {gen_server,handle_msg,6,[{file,"gen_server.erl"},{line,686}]}]}
3> 
```
# Here is the stack trace found in Erlang/OTP 21

```
Erlang/OTP 21 [erts-10.0] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [hipe]

Eshell V10.0  (abort with ^G)
1> dtls_server:start_link().
{ok,<0.96.0>}
2> Client = dtls_client:connect().
=ERROR REPORT==== 19-Jun-2018::15:37:30.756671 ===
** State machine <0.101.0> terminating
** Last event = {internal,
                    {client_hello,
                        {254,255},
                        <<91,41,133,170,172,252,112,102,184,128,99,120,9,104,
                          68,250,165,162,132,181,198,250,88,153,220,53,153,35,
                          82,153,127,254>>,
                        <<>>,
                        <<103,66,89,198,8,221,23,123,140,73,62,73,150,125,69,
                          192,157,223,85,202>>,
                        [<<0,255>>,<<0,140>>],
                        <<0>>,
                        {hello_extensions,undefined,undefined,undefined,
                            undefined,undefined,undefined,undefined,
                            undefined}}}
** When server state  = [{data,
                          [{"State",
                            {hello,
                             {state,server,
                              {#Ref<0.2207738215.804782084.211012>,<0.96.0>},
                              gen_udp,dtls_connection,udp,udp_closed,
                              udp_error,"localhost",4000,
                              {<0.99.0>,{{{127,0,0,1},61815},#Port<0.5>}},
                              {ssl_options,dtls,
                               [{254,255}],
                               verify_none,
                               {#Fun<ssl.8.77706381>,[]},
                               #Fun<ssl.9.77706381>,false,false,undefined,1,
                               <<>>,"***",<<>>,"***","***","***",<<>>,"***",
                               undefined,
                               {#Fun<dtls_server.0.3003642>,
                                <<18,52,86,120,144,18,52,86,120,144,18,52,86,
                                  120,144,170>>},
                               "***","***",
                               [<<0,140>>],
                               #Fun<ssl.2.77706381>,true,268435456,true,true,
                               infinity,false,undefined,undefined,undefined,
                               undefined,true,undefined,[],undefined,false,
                               true,one_n_minus_one,undefined,false,
                               {ssl_crl_cache,{internal,[]}},
                               undefined,
                               {elliptic_curves,
                                [{1,3,132,0,39},
                                 {1,3,132,0,38},
                                 {1,3,132,0,35},
                                 {1,3,36,3,3,2,8,1,1,13},
                                 {1,3,132,0,36},
                                 {1,3,132,0,37},
                                 {1,3,36,3,3,2,8,1,1,11},
                                 {1,3,132,0,34},
                                 {1,3,132,0,16},
                                 {1,3,132,0,17},
                                 {1,3,36,3,3,2,8,1,1,7},
                                 {1,3,132,0,10},
                                 {1,2,840,10045,3,1,7},
                                 {1,3,132,0,3},
                                 {1,3,132,0,26},
                                 {1,3,132,0,27},
                                 {1,3,132,0,32},
                                 {1,3,132,0,33},
                                 {1,3,132,0,24},
                                 {1,3,132,0,25},
                                 {1,3,132,0,31},
                                 {1,2,840,10045,3,1,1},
                                 {1,3,132,0,1},
                                 {1,3,132,0,2},
                                 {1,3,132,0,15},
                                 {1,3,132,0,9},
                                 {1,3,132,0,8},
                                 {1,3,132,0,30}]},
                               false,262144,full,[]},
                              {socket_options,list,0,0,0,true},
                              "***","***",0,"***",
                              #Ref<0.2207738215.804913156.210900>,"***",
                              #Ref<0.2207738215.804913156.210909>,
                              ssl_session_cache,
                              {ssl_crl_cache,
                               {{#Ref<0.2207738215.804913156.210903>,
                                 #Ref<0.2207738215.804913156.210904>},
                                []}},
                              {254,255},
                              undefined,false,undefined,
                              {undefined,undefined},
                              {undefined,undefined},
                              undefined,"***","***","***",undefined,"***",
                              "***","***",
                              {#Ref<0.2207738215.804913156.210901>,
                               #Ref<0.2207738215.804913156.210902>},
                              #Ref<0.2207738215.804782084.211016>,undefined,
                              "***",
                              {false,first},
                              {<0.96.0>,#Ref<0.2207738215.804782084.211015>},
                              undefined,undefined,false,true,false,false,
                              undefined,undefined,undefined,undefined,
                              undefined,"***",
                              {retransmit,1000},
                              #{current_cookie_secret =>
                                 <<198,245,11,48,47,50,250,140,63,84,173,249,
                                   227,14,154,115,17,8,98,247,186,198,219,78,
                                   73,129,85,235,121,71,232,102>>,
                                ignored_alerts => 0,max_ignored_alerts => 10,
                                previous_cookie_secret => <<>>}}}}]}]
** Reason for termination = error:function_clause
** Callback mode = [state_functions,state_enter]
** Stacktrace =
**  [{public_key,pkix_decode_cert,
                 [undefined,otp],
                 [{file,"public_key.erl"},{line,322}]},
     {ssl_handshake,select_hashsign,5,
                    [{file,"ssl_handshake.erl"},{line,1087}]},
     {dtls_handshake,handle_client_hello,5,
                     [{file,"dtls_handshake.erl"},{line,198}]},
     {dtls_connection,handle_client_hello,2,
                      [{file,"dtls_connection.erl"},{line,833}]},
     {gen_statem,call_state_function,5,[{file,"gen_statem.erl"},{line,1660}]},
     {gen_statem,loop_event_state_function,6,
                 [{file,"gen_statem.erl"},{line,1023}]},
     {dtls_connection,init,1,[{file,"dtls_connection.erl"},{line,97}]},
     {proc_lib,init_p_do_apply,3,[{file,"proc_lib.erl"},{line,249}]}]

=CRASH REPORT==== 19-Jun-2018::15:37:30.762033 ===
  crasher:
    initial call: dtls_connection:init/1
    pid: <0.101.0>
    registered_name: []
    exception error: no function clause matching
                     public_key:pkix_decode_cert(undefined,otp) (public_key.erl, line 322)
      in function  ssl_handshake:select_hashsign/5 (ssl_handshake.erl, line 1087)
      in call from dtls_handshake:handle_client_hello/5 (dtls_handshake.erl, line 198)
      in call from dtls_connection:handle_client_hello/2 (dtls_connection.erl, line 833)
      in call from gen_statem:call_state_function/5 (gen_statem.erl, line 1660)
      in call from gen_statem:loop_event_state_function/6 (gen_statem.erl, line 1023)
      in call from dtls_connection:init/1 (dtls_connection.erl, line 97)
    ancestors: [dtls_connection_sup,ssl_connection_sup,ssl_sup,<0.86.0>]
    message_queue_len: 0
    messages: []
    links: [<0.94.0>]
    dictionary: [{rand_seed,{#{bits => 58,jump => #Fun<rand.8.10897371>,
                                next => #Fun<rand.5.10897371>,type => exrop,
                                uniform => #Fun<rand.6.10897371>,
                                uniform_n => #Fun<rand.7.10897371>,
                                weak_low_bits => 1},
                              [204916380775812574|158919891959160964]}},
                  {ssl_pem_cache,ssl_pem_cache},
                  {ssl_manager,ssl_manager}]
    trap_exit: true
    status: running
    heap_size: 6772
    stack_size: 27
    reductions: 340060
  neighbours:

=SUPERVISOR REPORT==== 19-Jun-2018::15:37:30.764215 ===
    supervisor: {local,dtls_connection_sup}
    errorContext: child_terminated
    reason: {function_clause,
                [{public_key,pkix_decode_cert,
                     [undefined,otp],
                     [{file,"public_key.erl"},{line,322}]},
                 {ssl_handshake,select_hashsign,5,
                     [{file,"ssl_handshake.erl"},{line,1087}]},
                 {dtls_handshake,handle_client_hello,5,
                     [{file,"dtls_handshake.erl"},{line,198}]},
                 {dtls_connection,handle_client_hello,2,
                     [{file,"dtls_connection.erl"},{line,833}]},
                 {gen_statem,call_state_function,5,
                     [{file,"gen_statem.erl"},{line,1660}]},
                 {gen_statem,loop_event_state_function,6,
                     [{file,"gen_statem.erl"},{line,1023}]},
                 {dtls_connection,init,1,
                     [{file,"dtls_connection.erl"},{line,97}]},
                 {proc_lib,init_p_do_apply,3,
                     [{file,"proc_lib.erl"},{line,249}]}]}
    offender: [{pid,<0.101.0>},
               {id,undefined},
               {mfargs,{dtls_connection,start_link,undefined}},
               {restart_type,temporary},
               {shutdown,4000},
               {child_type,worker}]
=ERROR REPORT==== 19-Jun-2018::15:37:30.764317 ===
** Generic server <0.96.0> terminating
** Last message in was {listen,4000}
** When Server state == []
** Reason for termination ==
** {{{function_clause,
         [{public_key,pkix_decode_cert,
              [undefined,otp],
              [{file,"public_key.erl"},{line,322}]},
          {ssl_handshake,select_hashsign,5,
              [{file,"ssl_handshake.erl"},{line,1087}]},
          {dtls_handshake,handle_client_hello,5,
              [{file,"dtls_handshake.erl"},{line,198}]},
          {dtls_connection,handle_client_hello,2,
              [{file,"dtls_connection.erl"},{line,833}]},
          {gen_statem,call_state_function,5,
              [{file,"gen_statem.erl"},{line,1660}]},
          {gen_statem,loop_event_state_function,6,
              [{file,"gen_statem.erl"},{line,1023}]},
          {dtls_connection,init,1,[{file,"dtls_connection.erl"},{line,97}]},
          {proc_lib,init_p_do_apply,3,[{file,"proc_lib.erl"},{line,249}]}]},
     {gen_statem,call,[<0.101.0>,{start,infinity},infinity]}},
    [{gen,do_call,4,[{file,"gen.erl"},{line,177}]},
     {gen_statem,call_dirty,4,[{file,"gen_statem.erl"},{line,598}]},
     {ssl_connection,call,2,[{file,"ssl_connection.erl"},{line,2252}]},
     {ssl_connection,handshake,2,[{file,"ssl_connection.erl"},{line,122}]},
     {ssl,ssl_accept,3,[{file,"ssl.erl"},{line,194}]},
     {dtls_server,listen,1,[{file,"src/dtls_server.erl"},{line,31}]},
     {dtls_server,handle_info,2,[{file,"src/dtls_server.erl"},{line,20}]},
     {gen_server,try_dispatch,4,[{file,"gen_server.erl"},{line,637}]}]}

=CRASH REPORT==== 19-Jun-2018::15:37:30.765500 ===
  crasher:
    initial call: dtls_server:init/1
    pid: <0.96.0>
    registered_name: []
    exception exit: {{function_clause,
                         [{public_key,pkix_decode_cert,
                              [undefined,otp],
                              [{file,"public_key.erl"},{line,322}]},
                          {ssl_handshake,select_hashsign,5,
                              [{file,"ssl_handshake.erl"},{line,1087}]},
                          {dtls_handshake,handle_client_hello,5,
                              [{file,"dtls_handshake.erl"},{line,198}]},
                          {dtls_connection,handle_client_hello,2,
                              [{file,"dtls_connection.erl"},{line,833}]},
                          {gen_statem,call_state_function,5,
                              [{file,"gen_statem.erl"},{line,1660}]},
                          {gen_statem,loop_event_state_function,6,
                              [{file,"gen_statem.erl"},{line,1023}]},
                          {dtls_connection,init,1,
                              [{file,"dtls_connection.erl"},{line,97}]},
                          {proc_lib,init_p_do_apply,3,
                              [{file,"proc_lib.erl"},{line,249}]}]},
                     {gen_statem,call,[<0.101.0>,{start,infinity},infinity]}}
      in function  gen:do_call/4 (gen.erl, line 177)
      in call from gen_statem:call_dirty/4 (gen_statem.erl, line 598)
      in call from ssl_connection:call/2 (ssl_connection.erl, line 2252)
      in call from ssl_connection:handshake/2 (ssl_connection.erl, line 122)
      in call from ssl:ssl_accept/3 (ssl.erl, line 194)
      in call from dtls_server:listen/1 (src/dtls_server.erl, line 31)
      in call from dtls_server:handle_info/2 (src/dtls_server.erl, line 20)
      in call from gen_server:try_dispatch/4 (gen_server.erl, line 637)
    ancestors: [<0.79.0>]
    message_queue_len: 0
    messages: []
    links: [<0.79.0>]
    dictionary: []
    trap_exit: false
    status: running
    heap_size: 6772
    stack_size: 27
    reductions: 79743
  neighbours:
    neighbour:
      pid: <0.79.0>
      registered_name: []
      initial_call: {erlang,apply,2}
      current_function: {gen,do_call,4}
      ancestors: []
      message_queue_len: 0
      links: [<0.96.0>,<0.78.0>]
      trap_exit: false
      status: waiting
      heap_size: 987
      stack_size: 55
      reductions: 7697
      current_stacktrace: [{gen,do_call,4,[{file,"gen.erl"},{line,169}]},
                  {gen_statem,call_dirty,4,
                              [{file,"gen_statem.erl"},{line,598}]},
                  {ssl_connection,call,2,
                                  [{file,"ssl_connection.erl"},{line,2252}]},
                  {ssl_connection,handshake,2,
                                  [{file,"ssl_connection.erl"},{line,122}]},
                  {dtls_connection,start_fsm,8,
                                   [{file,"dtls_connection.erl"},{line,76}]},
                  {ssl_connection,connect,8,
                                  [{file,"ssl_connection.erl"},{line,91}]},
                  {ssl,connect,4,[{file,"ssl.erl"},{line,127}]},
                  {dtls_client,connect,0,
                               [{file,"src/dtls_client.erl"},{line,5}]}]

** exception exit: {{function_clause,[{public_key,pkix_decode_cert,
                                                  [undefined,otp],
                                                  [{file,"public_key.erl"},{line,322}]},
                                      {ssl_handshake,select_hashsign,5,
                                                     [{file,"ssl_handshake.erl"},{line,1087}]},
                                      {dtls_handshake,handle_client_hello,5,
                                                      [{file,"dtls_handshake.erl"},{line,198}]},
                                      {dtls_connection,handle_client_hello,2,
                                                       [{file,"dtls_connection.erl"},{line,833}]},
                                      {gen_statem,call_state_function,5,
                                                  [{file,"gen_statem.erl"},{line,1660}]},
                                      {gen_statem,loop_event_state_function,6,
                                                  [{file,"gen_statem.erl"},{line,1023}]},
                                      {dtls_connection,init,1,
                                                       [{file,"dtls_connection.erl"},{line,97}]},
                                      {proc_lib,init_p_do_apply,3,
                                                [{file,"proc_lib.erl"},{line,249}]}]},
                    {gen_statem,call,[<0.101.0>,{start,infinity},infinity]}}
3>
```
