defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  alias DiscussWeb.Router.Helpers, as: Routes
  alias Discuss.Topic


  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html", changeset: changeset
    # text conn, "THIS TOPIC CONTROLLER ENDPOINT WORKS - #{Mix}"
  end

  #write a function that adds two numbers and name the function sum of two numbers

end
