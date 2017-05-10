defmodule Manihome.Router do
  use Manihome.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Manihome do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    # resources "/accommodations", AccommodationController, only: [:index]
  end

   scope "/api", Manihome do
     pipe_through :api
     
     get "/", PageController, :index
     resources "/accommodations", AccommodationController, only: [:index, :create, :show, :update, :delete]
   end
end
