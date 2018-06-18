# DtlsProto

```elixir
Interactive Elixir (1.6.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> DtlsProto.Server.start_link()
{:ok, #PID<0.148.0>}
iex(2)> client = DtlsProto.Client.connnect()
{:sslsocket, {:gen_udp, #Port<0.4370>, :dtls_connection}, #PID<0.152.0>}
iex(3)> :ssl.send(client, "hello")
:ok
"[SERVER RECV]: {:ssl, {:sslsocket, {:gen_udp, {#PID<0.151.0>, {{{127, 0, 0, 1}, 52289}, #Port<0.4369>}}, :dtls_connection}, #PID<0.153.0>}, 'hello'}"
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `dtls_proto` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:dtls_proto, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/dtls_proto](https://hexdocs.pm/dtls_proto).

