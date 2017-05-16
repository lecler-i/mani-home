defmodule Manihome.AccommodationMedia do
  use Manihome.Web, :model
  use Arc.Ecto.Schema
  
  alias Manihome.Repo
  alias Manihome.Accommodation
 
   defimpl Poison.Encoder, for: Manihome.AccommodationMedia do
    def encode(media, options) do
      media
      |> Manihome.AccommodationMedia.getEncodeJson
      |> Map.take([:id, :urls])
      |> Poison.Encoder.Map.encode(options)
    end
  end

  # @derive {Poison.Encoder, only: [:id, :urls]}
  schema "accommodation_medias" do
    field :data, Manihome.AccommodationPic.Type
    belongs_to :accommodation, Manihome.Accommodation
    timestamps()
  end


  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def getEncodeJson(media) do
    %{
      id: media.id,
      urls: Manihome.AccommodationPic.urls({media.data, media})
    }
  end

  def changeset(struct, params \\ %{}) do
    acco = Accommodation
           |> Repo.get!(params["accommodation_id"])
           |> Repo.preload(:accommodation_medias)

    struct
    |> Repo.preload(:accommodation)
    |> cast_attachments(params, [:data])
    |> put_assoc(:accommodation, acco)
    |> validate_required([:accommodation, :data])
  end

end
