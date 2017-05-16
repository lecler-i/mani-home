defmodule Manihome.MessageController do
  use Manihome.Web, :controller

  alias Manihome.Message

  def index(conn, _params) do
    messages = Message
               |> order_by([m], asc: [m.inserted_at])
               |> Repo.all
               |> Repo.preload(:chat)
               |> Repo.preload(:user)

    render(conn, "index.json", messages: messages)
  end

  def create(conn, %{"chat_id" => chat_id, "message" => message_params}) do
    changeset = Message.changeset(%Message{}, chat_id, message_params)
    case Repo.insert(changeset) do
      {:ok, message} ->
        message = message
        |> Repo.preload(:chat)
        |> Repo.preload(:user)

        conn
        |> put_status(:created)
        |> put_resp_header("location", chat_message_path(conn, :show, chat_id, message))
        |> render("show.json", message: message)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Manihome.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    message = Message
              |> Repo.get!(id)
              |> Repo.preload(:chat)
              |> Repo.preload(:user)
    render(conn, "show.json", message: message)
  end

  def update(conn, %{"id" => id, "message" => message_params}) do
    message = Repo.get!(Message, id)
    changeset = Message.changeset(message, message_params)

    case Repo.update(changeset) do
      {:ok, message} ->
        render(conn, "show.json", message: message)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Manihome.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    message = Repo.get!(Message, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(message)

    send_resp(conn, :no_content, "")
  end
end
