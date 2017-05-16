defmodule Manihome.ChatView do
  use Manihome.Web, :view

  def render("index.json", %{chats: chats}) do
    %{data: render_many(chats, Manihome.ChatView, "chat.json")}
  end

  def render("show.json", %{chat: chat}) do
    %{data: render_one(chat, Manihome.ChatView, "chat.json")}
  end

  def render("chat.json", %{chat: chat}) do
    chat
  end
end
