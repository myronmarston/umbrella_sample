defmodule Foo.Mixfile do
  use Mix.Project

  def project do
    [app: :foo,
     version: "0.0.1",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.2-dev",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # To depend on another app inside the umbrella:
  #
  #   {:myapp, in_umbrella: true}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:bar, in_umbrella: true},
      {:baz, path: Path.expand("../../another_umbrella/apps/baz", __DIR__)},
    ] ++ optional_quux_dependency
  end

  if System.get_env("DEPEND_ON_QUUX") do
    defp optional_quux_dependency do
      [{:quux, path: Path.expand("../../another_umbrella/apps/quux", __DIR__)}]
    end
  else
    defp optional_quux_dependency do
      []
    end
  end
end
