defmodule FormChangesetExampleWeb.PageController do
  use FormChangesetExampleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
