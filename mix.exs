defmodule OpenrussianScraper.MixProject do
  use Mix.Project

  def project do
    [
      app: :openrussian_scraper,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:floki, "~> 0.37.1"},
      {:req, "~> 0.5.1"}
    ]
  end
end
