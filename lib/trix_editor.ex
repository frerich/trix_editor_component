defmodule TrixEditor do
  use Phoenix.Component

  import Phoenix.HTML.Form, only: [hidden_input: 3]

  css_path = "assets/node_modules/trix/dist/trix.css"

  @external_resource css_path
  @trix_css File.read!(css_path)

  attr(:field, Phoenix.HTML.FormField,
    required: true,
    doc: "A %Phoenix.HTML.Form{}/field name tuple, for example: {@form[:notes]}."
  )

  attr(:id, :string,
    default: "trix_editor",
    doc: """
    The id to be used in the form, defaults to 'trix_editor'.
    """
  )

  attr(:value, :string,
    default: "",
    doc: """
    An initial value to display in the editor.
    """
  )

  attr(:placeholder, :string,
    default: "",
    doc: """
    An placeholder text to display in the editor.
    """
  )

  attr(:rest, :global,
    doc: """
    Additional HTML attributes to add to the input element, ensuring proper escaping.
    """
  )

  def trix_editor(assigns) do
    assigns = assign(assigns, :trix_css, @trix_css)

    ~H"""
    <div id={@id} phx-update="ignore" {@rest}>
      <style><%= {:safe, @trix_css} %></style>
      <%= hidden_input(@field.form, @field.field, id: "#{@id}_input", value: @value) %>
      <trix-editor placeholder={@placeholder} input={"#{@id}_input"}></trix-editor>
    </div>
    """
  end
end
