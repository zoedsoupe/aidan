defmodule Aidan.MixProject do
  use Mix.Project

  @source_url "https://github.com/zoedsoupe/aidan"
  @version "0.1.0"

  def project do
    [
      app: :aidan,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Aidan.Application, []}
    ]
  end

  defp deps do
    [
      {:ecto, "~> 3.8"},
      {:tesla, "~> 1.4"},
      {:finch, "~> 0.14.0"},
      {:jason, ">= 1.0.0"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    [
      description: "Telegram Bot API Wrapper written in Elixir",
      maintainers: ["zoedsoupe"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      extras: [
        LICENSE: [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: @source_url,
      formatters: ["html"]
    ]
  end
end
