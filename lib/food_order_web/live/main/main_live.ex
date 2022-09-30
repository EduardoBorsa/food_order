defmodule FoodOrderWeb.MainLive do
  use FoodOrderWeb, :live_view
  alias FoodOrderWeb.Main.Hero
  alias FoodOrderWeb.Main.Items

  @impl true
  def mount(_assigns, _session, socket) do
    {:ok, socket}
  end
end
