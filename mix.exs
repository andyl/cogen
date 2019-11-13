defmodule UberGen.MixProject do
  use Mix.Project

  @version "0.0.1"

  def project do
    [
      app: :uber_gen,
      version: @version,
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript(),
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:version_tasks, "~> 0.11.3"},
      {:yaml_elixir, "~> 2.4.0"},
      {:ecto, "~> 3.0"},
    ]
  end

  defp escript do
    [
      main_module: UberGen.Cli
    ]
  end
end
