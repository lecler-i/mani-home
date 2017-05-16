defmodule Manihome.ChatController do
  use Manihome.Web, :controller

  alias Manihome.Chat

  def index(conn, _params) do
    chats = Chat
            |>Repo.all
            |> Repo.preload(:users)
    render(conn, "index.json", chats: chats)
  end

  def create(conn, %{"chat" => chat_params}) do
    changeset = Chat.changeset(%Chat{}, chat_params)

    case Repo.insert(changeset) do
      {:ok, chat} ->
       chat = %{chat | messages: []}
        conn
        |> put_status(:created)
        |> put_resp_header("location", chat_path(conn, :show, chat))
        |> render("show.json", chat: chat)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Manihome.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    chat = Chat
           |> Repo.get!(id)
           |> Repo.preload(:users)
    render(conn, "show.json", chat: chat)
  end

  def update(conn, %{"id" => id, "chat" => chat_params}) do
    chat = Repo.get!(Chat, id)
    changeset = Chat.changeset(chat, chat_params)

    case Repo.update(changeset) do
      {:ok, chat} ->
        render(conn, "show.json", chat: chat)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Manihome.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    chat = Chat
           |> Repo.get!(id)
           |> Repo.preload(:messages)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(chat)

    send_resp(conn, :no_content, "")
  end
end
