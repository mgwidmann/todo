defmodule Todo.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :title, :text
      add :completed, :boolean, default: false, null: false
      add :description, :text

      timestamps()
    end

  end
end
