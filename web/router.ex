defmodule PhoenixAngular.Router do
  use PhoenixAngular.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  scope "/", PhoenixAngular do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/user", UserController, :index
    post "/user/login" , UserController, :authenticate
  end

  # Other scopes may use custom stacks.
  scope "/api", PhoenixAngular do
    pipe_through :api

    post "/user/register" , UserController, :create
    get "/user/logout" , UserController, :logout
    # post "/user/login" , UserController, :authenticate
  end
end
