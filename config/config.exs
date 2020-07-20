import Config

alias Hush.Provider.{
  GcpSecretManager,
  SystemEnvironment
}

{status, key} = File.read("priv/gcp_key.json")

config :goth,
  json: System.get_env("GOOGLE_APPLICATION_CREDENTIALS", key)

config :hush,
  providers: [
    GcpSecretManager
  ]

config :hush_gcp_secret_manager,
  project_id: "hush-sample-app"

config :hush_sample_app,
  gcp: {:hush, GcpSecretManager, "foo"},
  env: {:hush, SystemEnvironment, "USER"},
  default: {:hush, SystemEnvironment, "THIS_ENV_DOES_NOT_EXIST", [default: "checks out"]}
