defmodule TrixEditor do
  @moduledoc """
  The main public API for the trix_editor_Component library.

  This module provides a Phoenix LiveView component for embedding a rich-text
  edit into templates.
  """
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

  @doc """
  Embed a rich-text editor.

  This component is meant to be invoked using the HEex syntax for function
  componets. An optional `id` assign has to be passed in case more than one
  editor is used on the same page.

  ## Examples

      import TrixEditor, only: [trix_editor: 1]

      # ...

      def render(assigns) do
        ~H\"""
          <.form for={@form} phx-change="validate" phx-submit="save">
            <.input type="name" field={@form[:name]} />
            <.input type="food" field={@form[:food]} />
            <.trix_editor field={@form[:notes]} />
            <button>Save</button>
          </.form>
        \"""
      end
  """
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
