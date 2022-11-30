defmodule BookForm.Repo do
  use Ecto.Repo,
    otp_app: :book_form,
    adapter: Ecto.Adapters.Postgres
end
