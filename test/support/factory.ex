defmodule FoodOrder.Factory do
  use ExMachina.Ecto, repo: FoodOrder.Repo

  alias FoodOrder.Products.Product

  def product_factory(attrs) do
    default = %{
      name: sequence(:name, &"account-#{&1}"),
      description: sequence(:description, &"description-#{&1}"),
      price: ExMachina.Sequence.next(:price, & &1),
      size: Enum.random(["small", "medium", "large"])
    }

    product_attrs = merge_attributes(default, attrs)

    %Product{}
    |> Product.changeset(product_attrs)
    |> return_schema_or_errors()
  end

  # Private Doc: 
  # This will return the schema from the factory or the changeset with the errors.
  @spec return_schema_or_errors(Ecto.Changeset.t()) :: map() | Ecto.Changeset.t()
  defp return_schema_or_errors(%Ecto.Changeset{} = changeset) do
    changeset
    |> Map.get(:valid?)
    |> case do
      true ->
        changeset
        |> Ecto.Changeset.apply_changes()

      false ->
        changeset
    end
  end
end
