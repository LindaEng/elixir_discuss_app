defmodule DiscussWeb.Models.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :content, string
    belongs_to :user, Discuss.User
    belongs_to :topic, Discuss.Topic

    timestamps()
  end

end
