defmodule TrixEditor do
  use Phoenix.Component

  import Phoenix.HTML.Form, only: [hidden_input: 3]

  css_path = "assets/node_modules/trix/dist/trix.css"

  @external_resource css_path
  @trix_css File.read!(css_path)

  def trix_editor(assigns) do
    assigns =
      assigns
      |> assign_new(:id, :trix_editor)
      |> assign(:trix_css, @trix_css)

    ~H"""
    <div id={@id} phx-update="ignore">
      <style><%= {:safe, @trix_css} %></style>
      <%= hidden_input(@for, @field, id: "#{@id}_input") %>
      <trix-editor input={"#{@id}_input"}></trix-editor>
    </div>
    """
  end
end
