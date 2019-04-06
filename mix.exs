defmodule ChineseDictionary.MixProject do
  use Mix.Project

  def project do
    [
      app: :chinese_dictionary,
      version: "0.1.1",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      # Docs
      name: "Chinese Dictionary",
      source_url: "https://github.com/JorisKok/chinese_dictionary",
      docs: [
        extras: ["README.md"]
      ]
    ]
  end

  defp description do
    "A chinese dictionary based on CEDict. \n
    Supports Traditional -> English, and Simplified -> English"
  end

  defp package do
    [
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => "https://github.com/JorisKok/chinese_dictionary"
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
      {:assert_value, ">= 0.0.0", only: [:dev, :test]},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:sqlitex, "~> 1.5"},
      {:httpoison, "~> 1.4"}
    ]
  end
end
