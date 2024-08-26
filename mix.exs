defmodule Tqdm.Mixfile do
  use Mix.Project

  @version "0.0.4"

  def project do
    [
      app: :tqdm,
      version: @version,
      elixir: "~> 1.15",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      source_url: "https://github.com/antipax/tqdm_elixir",
      docs: [
        main: "Tqdm",
        extras: ["README.md"],
        source_ref: "v#{@version}"
      ],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  defp deps do
    [
      {:credo, ">= 0.0.0", only: [:test, :dev], runtime: false},
      {:dialyxir, ">= 0.0.0", only: [:test, :dev], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:earmark, "~> 1.4", only: :dev},
      {:excoveralls, "~> 0.5", only: :test},
      {:inch_ex, ">= 0.0.0", only: :docs}
    ]
  end

  defp description do
    "Add a progress bar to your enumerables (Lists, Maps, Streams, Ranges, etc.) in a second."
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Eric Entin"],
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => "https://github.com/antipax/tqdm_elixir"
      }
    ]
  end
end
