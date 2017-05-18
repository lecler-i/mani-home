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
    plug Joken.Plug,
    verify: &Manihome.JWTHelper.verify/0,
    on_error: &Manihome.JWTHelper.error/2 
  end

  pipeline :api_auth do
    plug Manihome.JwtAuthPlug
  end

  scope "/", Manihome do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    # resources "/accommodations", AccommodationController, only: [:index]
  end

   scope "/api", Manihome do
     pipe_through :api
     
     post "/login", UserController, :login

     pipe_through :api_auth
     get "/", PageController, :index


     resources "/users", UserController

     resources "/accommodations", AccommodationController do
       resources "/medias", AccommodationMediaController
     end

     resources "/chats", ChatController do
       resources "/messages", MessageController
     end
   end
end
