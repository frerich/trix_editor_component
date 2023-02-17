defmodule TrixEditor.Component do
  use Phoenix.LiveComponent

  import Phoenix.HTML.Form

  def render(assigns) do
    ~H"""
    <div id={@id} phx-update="ignore">
      <%= hidden_input(@for, @field, phx_hook: "TrixEditor", id: "#{@id}_input") %>
      <trix-editor input={"#{@id}_input"}></trix-editor>
    </div>
    """
  end
end
