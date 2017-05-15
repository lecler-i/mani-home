defmodule Manihome.AccommodationPic do
  use Arc.Definition

  # Include ecto support (requires package arc_ecto installed):
  use Arc.Ecto.Definition

   @versions [:original, :thumb]

  @acl :public_read
  
  # Whitelist file extensions:
   def validate({file, _}) do
     ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
   end

  # Define a thumbnail transformation:
   def transform(:thumb, _) do
     {:convert, "-strip -thumbnail 250x250^ -gravity center -extent 250x250 -format png", :png}
   end

  # Override the persisted filenames:
  # def filename(version, _) do
  #   version
  # end

  # Override the storage directory:
   def storage_dir(_, {_, scope}) do
     "uploads/accommodations/pictures/#{scope.id}"
   end

  # Provide a default URL if there hasn't been a file uploaded
   def default_url(version, _) do
     Manihome.Endpoint.url <> "/images/accommodations/default_#{version}.png"
   end

  # Specify custom headers for s3 objects
  # Available options are [:cache_control, :content_disposition,
  #    :content_encoding, :content_length, :content_type,
  #    :expect, :expires, :storage_class, :website_redirect_location]
  #
  # def s3_object_headers(version, {file, scope}) do
  #   [content_type: Plug.MIME.path(file.file_name)]
  # end

end
