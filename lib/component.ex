defmodule TrixEditor.Component do
  use Phoenix.LiveComponent

  import Phoenix.HTML.Form, only: [hidden_input: 3]

  @external_resource "assets/node_modules/trix/dist/trix.css"
  @trix_css File.read!("assets/node_modules/trix/dist/trix.css")

  def render(assigns) do
    assigns = assign(assigns, trix_css: @trix_css)

    ~H"""
    <div id={@id} phx-update="ignore">
      <style><%= {:safe, @trix_css} %></style>
      <%= hidden_input(@for, @field, id: "#{@id}_input") %>
      <trix-editor input={"#{@id}_input"}></trix-editor>
    </div>
    """
  end
end
