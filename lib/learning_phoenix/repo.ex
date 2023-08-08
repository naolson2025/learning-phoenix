defmodule LearningPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :learning_phoenix,
    adapter: Ecto.Adapters.Postgres
end
