defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  def new(conn, params) do
    IO.puts "++++++"
    IO. inspect conn
    IO. inspect params
    IO.puts "++++++"
  end
end
