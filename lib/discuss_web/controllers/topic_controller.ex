defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  alias DiscussWeb.Router.Helpers, as: Routes
  alias Discuss.Topic
  alias Discuss.Repo

  plug Discuss.Plugs.RequireAuth when action in [:new, :create, :edit, :update, :delete]
  plug :check_topic_owner when action in [:update, :edit, :delete]


  def index(conn, _params) do
    topics = Repo.all(Topic)

    render conn, "index.html", topics: topics
  end

  def show(conn, %{"id" => topic_id}) do
    topic = Repo.get(Topic, topic_id)
    render conn, "show.html", topic: topic
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html", changeset: changeset
    # text conn, "THIS TOPIC CONTROLLER ENDPOINT WORKS - #{Mix}"
  end

  def create(conn, %{"topic" => topic_params}) do
    changeset = conn.assigns.user
    |> Ecto.build_assoc(:topics)
    |> Topic.changeset(topic_params)

    case Repo.insert(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic Created")
        |> redirect(to: Routes.topic_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end

  def edit(conn, %{"id" => topic_id}) do
    topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(topic)

    render conn, "edit.html", changeset: changeset, topic: topic
  end

  def update(conn, %{"id" => topic_id, "topic" => topic}) do
    old_topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(old_topic, topic)

    case Repo.update(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic Updated")
        |> redirect(to: Routes.topic_path(conn, :index))
      {:error, changeset} ->
        render conn, "edit.html", changeset: changeset, topic: old_topic
    end
  end

  def delete(conn, %{"id" => topic_id}) do
    topic = Repo.get(Topic, topic_id)

    case Repo.delete(topic) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic deleted successfully!")
        |> redirect(to: Routes.topic_path(conn, :index))
      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Failed to delete topic")
        |> redirect(to: Routes.topic_path(conn, :index))
    end
  end

  def check_topic_owner(conn, _params) do
    %{params: %{"id" => topic_id}} = conn

    if Repo.get(Topic, topic_id).user_id == conn.assigns.user.id do
      conn
    else
      conn
      |> put_flash(:error, "You cannot edit that")
      |> redirect(to: Routes.topic_path(conn, :index))
      |> halt()
    end

  end
end
