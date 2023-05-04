defmodule TodoRest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TodoRestWeb.Telemetry,
      # Start the Ecto repository
      TodoRest.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: TodoRest.PubSub},
      # Start Finch
      {Finch, name: TodoRest.Finch},
      # Start the Endpoint (http/https)
      TodoRestWeb.Endpoint
      # Start a worker by calling: TodoRest.Worker.start_link(arg)
      # {TodoRest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TodoRest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TodoRestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
