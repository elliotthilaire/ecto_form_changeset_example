defmodule FormChangesetExampleWeb.SurveyController do
  use FormChangesetExampleWeb, :controller

  alias Ecto.Changeset
  alias FormChangesetExampleWeb.SurveyForm

  plug :validate_form when action in [:create]

  def new(conn, _params) do
    changeset = SurveyForm.changeset(%SurveyForm{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, params) do
    changeset = SurveyForm.changeset(%SurveyForm{}, params["survey_form"])

    # Send valid input somewhere useful
    changeset |> Changeset.get_change(:name) |> IO.inspect
    changeset |> Changeset.get_change(:favourite_animal) |> IO.inspect

    conn
    |> put_flash(:info, "Survey created successfully.")
    |> redirect(to: survey_path(conn, :new))
  end

  defp validate_form(conn, _) do
    changeset = SurveyForm.changeset(%SurveyForm{}, conn.params["survey_form"])

    if changeset.valid? do
      conn
    else
      changeset = %{changeset | action: :submit}

      conn
      |> render("new.html", changeset: changeset)
      |> halt
    end
  end
end
