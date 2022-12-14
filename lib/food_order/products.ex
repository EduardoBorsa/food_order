defmodule FoodOrder.Products do
  @moduledoc """
  Provides a functionality to work with products.
  """
  alias FoodOrder.Products.Product
  alias FoodOrder.Repo

  @doc """
    List all product.
  """
  @spec list_products() :: list(Product.t())
  def list_products, do: Repo.all(Product)

  def get!(id), do: Repo.get!(Product, id)

  @doc """
    Creates a product.
  """
  @spec create_product(map()) :: {:ok, Product.t()} | {:error, Ecto.Changeset.t()}
  def create_product(attrs \\ %{}) do
    attrs
    |> Product.changeset()
    |> Repo.insert()
  end

  def update_product(product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  def delete(id) do
    id
    |> get!()
    |> Repo.delete()
  end

  def change_product(product, params \\ %{}), do: Product.changeset(product, params)
end
