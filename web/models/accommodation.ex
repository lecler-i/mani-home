defmodule Manihome.Accommodation do
  use Manihome.Web, :model
  
  alias Manihome.Repo
  
@derive {Poison.Encoder, only: [
  :id,
  :user,
  :name,
  :type,
  :longitude,
  :latitude,
  :rent_price,
  :date_end,
  :room_nbr,
  :room_available,
  :contract_type,
  :date_begin,
  :draft,
  :accommodation_medias]}

  schema "accommodations" do
    field :name, :string
    field :type, AccommodationType
    field :longitude, :float
    field :latitude, :float
    field :rent_price, :integer
    field :date_end, :utc_datetime
    field :room_nbr, :integer
    field :room_available, :integer
    field :contract_type, ContractType
    field :date_begin, :utc_datetime
    field :draft, :boolean
    timestamps()

    belongs_to :user, Manihome.User
    has_many :accommodation_medias, Manihome.AccommodationMedia, on_delete: :delete_all

  end

  def changeset(model, params \\ :empty) do
    user = Manihome.User
           |> Repo.get!(1)
           |> Repo.preload(:accommodations)

    model
    |> Repo.preload(:user)
    |> cast(params, ~w(name type longitude latitude rent_price room_nbr room_available contract_type date_begin draft), [])
    |> put_assoc(:user, user)
  end


end

