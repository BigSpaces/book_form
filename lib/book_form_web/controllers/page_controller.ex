defmodule BookFormWeb.PageController do
  use BookFormWeb, :controller

  def index(conn, _params) do
    changeset = BookForm.Book.changeset(%BookForm.Book{})
    render(conn, "index.html", changeset: changeset)
  end

  def create(conn, params) do
    case BookForm.Book.new(params["book"]) do
      {:ok, _book} ->
        conn
        |> put_flash(:info, "Success!")
        |> redirect(to: "/")

      {:error, changeset} ->
        conn
        |> put_flash(:error, "You f***, Andrew Dixit!")
        |> render("index.html", changeset: changeset)
    end
  end
end
