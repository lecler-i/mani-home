defmodule Manihome.AccommodationMedia do
  use Manihome.Web, :model
  use Arc.Ecto.Schema
  
  schema "accommodation_media" do
    field :data, Manihome.AccommodationPic.Type
    belongs_to :accommodation, Manihome.Accommodation
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast_attachments(params, [:data])
    |> validate_required([:data])
  end
end
