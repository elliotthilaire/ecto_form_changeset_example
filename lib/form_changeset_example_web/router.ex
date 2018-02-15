defmodule FormChangesetExampleWeb.Router do
  use FormChangesetExampleWeb, :router

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

  scope "/", FormChangesetExampleWeb do
    pipe_through :browser # Use the default browser stack

    get "/", SurveyController, :new
    post "/", SurveyController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", FormChangesetExampleWeb do
  #   pipe_through :api
  # end
end
