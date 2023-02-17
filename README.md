# `trix_editor_component`

## Introduction

This library provides a LiveView component offering a full-featured rich text editor based on the [Trix](https://trix-editor.org/) editor.

## Installation

1. Add `trix_editor_component` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:trix_editor_component, "~> 0.1"}
  ]
end
```

2. Include required JavaScript logic into your application by adding the following line to the `app.js` script of your Phoenix project:
```javascript
import "trix_editor_component"
```

3. In your templates, start using any of the offered LiveView components, e.g.
```elixir
[..]
<.form for={@form} phx-change="validate" phx-submit="save">
  <.input type="name" field={@form[:name]} />
  <.input type="food" field={@form[:food]} />
  <.trix_editor field={@form[:notes]} placeholder="Notes..."/>
  <button>Save</button>
</.form>
[..]
```

## Credits

This library was written by [Frerich Raabe](mailto:frerich.raabe@gmail.com),
however it is really just standing on the shoulders of giants:

* [Phoenix LiveView](https://github.com/phoenixframework/phoenix_live_view) is what enables the interactivity
* [Trix](https://trix-editor.org/) provides the frontend terminal component
