defmodule FoodOrder.Products.Product do
  @type t :: %__MODULE__{
          name: String.t(),
          description: String.t(),
          price: Money.t(),
          size: String.t(),
          updated_at: NaiveDateTime.t(),
          inserted_at: NaiveDateTime.t()
        }

  use Ecto.Schema
  import Ecto.Changeset

  @optional_fields ~w(description)a
  @required_fields ~w(name price size)a

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "products" do
    field :name, :string
    field :description, :string
    field :price, Money.Ecto.Amount.Type
    field :size, :string

    timestamps()
  end

  def changeset(attrs \\ %{}) do
    changeset(%__MODULE__{}, attrs)
  end

  def changeset(product, attrs) do
    product
    |> cast(attrs, @optional_fields ++ @required_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:name, name: :products_name_index)
  end
end
