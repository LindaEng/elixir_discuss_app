defmodule DiscussWeb.UserSocket do
  use Phoenix.Socket

  channel "comments:*", Discuss.CommentsChannel

  @impl true
  def connect(%{"token" => token}, socket, _connect_info) do
    IO.puts("THIS IS THE TOKEN ++++++")
    IO.puts(token)
    {:ok, socket}
  end

  @impl true
  def id(_socket), do: nil
end
