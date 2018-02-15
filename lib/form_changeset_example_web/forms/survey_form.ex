defmodule FormChangesetExampleWeb.SurveyForm do
  @moduledoc """
  Databaseless schema for validating params for survey form
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias FormChangesetExampleWeb.SurveyForm

  embedded_schema do
    field :name, :string
    field :favourite_animal, :string

    timestamps()
  end

  def changeset(%SurveyForm{} = survey, attrs \\ %{}) do
    survey
    |> cast(attrs, [:name, :favourite_animal])
    |> validate_required([:name, :favourite_animal])
  end
end
