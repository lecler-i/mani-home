defmodule Manihome.MessagesView do
  use Manihome.Web, :view

  def render("index.json", %{message: message}) do
    %{data: render_many(message, Manihome.MessagesView, "messages.json")}
  end

  def render("show.json", %{messages: messages}) do
    %{data: render_one(messages, Manihome.MessagesView, "messages.json")}
  end

  def render("messages.json", %{messages: messages}) do
    %{id: messages.id}
  end
end
