defmodule Manihome.MessageView do
  use Manihome.Web, :view

  def render("index.json", %{messages: messages}) do
    %{data: render_many(messages, Manihome.MessageView, "message.json")}
  end

  def render("show.json", %{message: message}) do
    %{data: render_one(message, Manihome.MessageView, "message.json")}
  end

  def render("message.json", %{message: message}) do
    message
  end
end
