defmodule PhoenixAngular.User do
  use PhoenixAngular.Web, :model

  schema "users" do
    field :email, :string
    field :password, :string
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:email, :password, :first_name, :last_name])
    |> validate_required([:email, :password, :first_name, :last_name])
    |> unique_constraint(:email)
  end
end
