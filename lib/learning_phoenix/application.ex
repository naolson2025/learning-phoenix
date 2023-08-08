defmodule LearningPhoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LearningPhoenixWeb.Telemetry,
      # Start the Ecto repository
      LearningPhoenix.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: LearningPhoenix.PubSub},
      # Start Finch
      {Finch, name: LearningPhoenix.Finch},
      # Start the Endpoint (http/https)
      LearningPhoenixWeb.Endpoint
      # Start a worker by calling: LearningPhoenix.Worker.start_link(arg)
      # {LearningPhoenix.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LearningPhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LearningPhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
