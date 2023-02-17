defmodule TrixEditor do
  use Phoenix.Component

  import Phoenix.Component, only: [live_component: 1]

  def trix_editor(assigns) do
    assigns
    |> Map.put_new(:id, :trix_editor)
    |> Map.put(:module, __MODULE__.Component)
    |> live_component()
  end
end
