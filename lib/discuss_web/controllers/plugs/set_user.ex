defmodule Discuss.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Repo
  alias Discuss.User
  alias Discuss.Router.Helpers

  def init(_params) do

  end

  def call(conn, _params) do
    user_id = get_session(conn, :user_id)
    IO.inspect(user_id)
    IO.puts("+++")
    IO.inspect(conn.assigns)
    cond do
      user = user_id && Repo.get(User, user_id) ->
        assign(conn, :user, user)
      true ->
        assign(conn, :user, nil)
    end
  end
end
