defmodule Todo.TodoService.Todo do
  use Ecto.Schema
  import Ecto.Changeset
  alias Todo.TodoService.Todo


  schema "todos" do
    field :completed, :boolean, default: false
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Todo{} = todo, attrs) do
    todo
    |> cast(attrs, [:title, :completed, :description])
    |> validate_required([:title, :completed, :description])
  end
end
