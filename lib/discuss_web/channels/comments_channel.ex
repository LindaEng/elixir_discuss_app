defmodule Discuss.CommentsChannel do
  use DiscussWeb, :channel
  alias Mix.Tasks.Hex.User
  alias Discuss.{Topic, Repo, Comment, User}

  def join("comments:" <> topic_id, _params, socket) do
    topic_id = String.to_integer(topic_id)
    topic = Topic
      |> Repo.get(topic_id)
      |> Repo.preload(comments: [:user])

    {:ok, %{comments: topic.comments}, assign(socket, :topic, topic)}
  end

  def handle_in(_name, %{"content" => content}, socket) do
    topic = socket.assigns.topic

    changeset = topic
      |> Ecto.build_assoc(:comments, %{user_id: topic.user_id})
      |> Comment.changeset(%{content: content})

      case Repo.insert(changeset) do
        {:ok, comment} ->
          comment = Repo.preload(comment, :user)
          broadcast!(socket, "comments:#{socket.assigns.topic.id}:new", %{comment: comment})
          {:reply, :ok, socket}
        {:error, _reason} ->
          {:reply, {:error, %{errors: changeset}}, socket}
      end
    {:reply, :ok, socket}
  end
end
