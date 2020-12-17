defmodule HushSampleApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :hush_sample_app,
      version: "0.0.1",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [
        hush_sample_app: [
          config_providers: [{Hush.ConfigProvider, nil}]
        ]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {HushSampleApp, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:hush, ">= 0.0.0"},
      {:hush_aws_secrets_manager, ">= 0.0.0"},
      {:hush_gcp_secret_manager, ">= 0.0.0"},
      # keep this until hackney 1.16.1
      {:hackney, git: "https://github.com/benoitc/hackney.git", tag: "master", override: true},
      {:jose,
       git: "https://github.com/potatosalad/erlang-jose.git", tag: "master", override: true}
    ]
  end
end
