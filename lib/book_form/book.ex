defmodule BookForm.Book do
  defstruct [:title, :author, :content, :has_licence, :published_on]

  @types %{
    title: :string,
    author: :string,
    content: :string,
    has_licence: :boolean,
    published_on: :date
  }

  def changeset(%__MODULE__{} = book, params \\ %{}) do
    {book, @types}
    |> Ecto.Changeset.cast(params, Map.keys(@types))
    |> Ecto.Changeset.validate_required([:title, :content])
    |> Ecto.Changeset.validate_length(:title, min: 3, max: 100)
    |> Ecto.Changeset.validate_acceptance(:has_licence)
  end

  def new(params) do
    %__MODULE__{}
    |> changeset(params)
    |> Ecto.Changeset.apply_action(:update)
  end
end
