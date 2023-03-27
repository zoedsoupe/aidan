defmodule Aidan.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Finch, name: AidanHTTPClient}
    ]

    opts = [strategy: :one_for_one, name: Aidan.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
