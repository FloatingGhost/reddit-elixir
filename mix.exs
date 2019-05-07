defmodule Reddit.MixProject do
  use Mix.Project

  def project do
    [
      app: :reddit,
      description: "A wrapper to Reddit's API that actually works",
      version: "0.1.1",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: "https://github.com/FloatingGhost/reddit",
      package: package()
    ]
  end

  defp package() do
    [
      licenses: ["AGPL-3.0"],
      links: %{
        "github" => "https://github.com/FloatingGhost/reddit-elixir"
      }
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:tesla, "~> 1.2.1"},
      {:jason, "~> 1.1"}
    ]
  end
end
