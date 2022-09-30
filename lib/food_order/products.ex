defmodule FoodOrder.Products do
  @moduledoc """
  Provides a functionality to work with products.
  """
  alias FoodOrder.Products.Product
  alias FoodOrder.Repo

  @doc """
    List all product.
  """
  @spec list_products() :: list(Product)
  def list_products, do: Repo.all(Product)

  @doc """
    Creates a product.
  """
  @spec create_product(map()) :: {:ok, Product.t()} | {:error, Ecto.Changeset.t()}
  def create_product(attrs \\ %{}) do
    attrs
    |> Product.changeset()
    |> Repo.insert()
  end
end
