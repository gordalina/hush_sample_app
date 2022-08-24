defmodule HushSampleApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :hush_sample_app,
      version: "0.0.1",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [
        hush_sample_app: [
          config_providers: [{Hush.ConfigProvider, nil}]
        ]
      ]
    ]
  end

  def application do
    [
      mod: {HushSampleApp, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:hush, "1.0.0-rc.0"},
      {:hush_aws_secrets_manager, "1.0.0-rc.0"},
      {:hush_gcp_secret_manager, "1.0.0-rc.0"},
      {:jason, "~> 1.3"}
    ]
  end
end
