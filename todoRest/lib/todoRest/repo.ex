defmodule TodoRest.Repo do
  use Ecto.Repo,
    otp_app: :todoRest,
    adapter: Ecto.Adapters.Postgres
end
