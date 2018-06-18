defmodule DtlsProto do
  defmodule Server do
    use GenServer

    def start_link(port \\ 4000) do
      GenServer.start_link(__MODULE__, port, name: DtlsProto.Server)
    end

    def init(port) do
      send(self(), {:listen, port})
      {:ok, %{}}
    end

    def handle_info({:listen, port}, state) do
      listen(port)
      {:noreply, state}
    end

    def handle_info(socket_stuff, state) do
      IO.inspect("[SERVER RECV]: #{inspect(socket_stuff)}")
      {:noreply, state}
    end

    def listen(port) do
      {:ok, socket} = :ssl.listen(port, opts())
      {:ok, socket} = :ssl.transport_accept(socket)
      :ssl.ssl_accept(socket)
      :ssl.recv(socket, 0)
      socket
    end

    def user_lookup(:psk, _username, userstate) do
      {:ok, userstate}
    end

    def opts do
      [
        ssl_imp: :new,
        active: true,
        verify: :verify_none,
        versions: [:dtlsv1],
        protocol: :dtls,
        ciphers: [{:psk, :aes_128_cbc, :sha}],
        psk_identity: 'Client_identity',
        user_lookup_fun: {&user_lookup/3, <<0x12>>},
        cb_info: {:gen_udp, :udp, :udp_close, :udp_error}
      ]
    end
  end

  defmodule Client do
    def connnect() do
      {:ok, client} = :ssl.connect({127, 0, 0, 1}, 4000, opts())
      client
    end

    def user_lookup(:psk, _username, userstate) do
      {:ok, userstate}
    end

    def opts do
      [
        ssl_imp: :new,
        active: true,
        verify: :verify_none,
        versions: [:dtlsv1],
        protocol: :dtls,
        ciphers: [{:psk, :aes_128_cbc, :sha}],
        psk_identity: 'Client_identity',
        user_lookup_fun: {&user_lookup/3, <<0x12>>},
        cb_info: {:gen_udp, :udp, :udp_close, :udp_error}
      ]
    end
  end
end
