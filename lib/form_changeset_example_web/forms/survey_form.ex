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
    |> validate_is_dog(:favourite_animal)
  end

  defp validate_is_dog(changeset, field) do
    changeset
    |> validate_change(field, &dog_validator/2)
  end

  defp dog_validator(field, value) do
    if value == "dog" do
      []
    else
      [{field, "must be dog"}]
    end
  end
end
