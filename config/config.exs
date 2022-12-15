import Config

alias Hush.Provider.{
  AwsSecretsManager,
  GcpSecretManager
}

config :ex_aws,
  access_key_id: [{:system, "AWS_ACCESS_KEY_ID"}],
  secret_access_key: [{:system, "AWS_SECRET_ACCESS_KEY"}]

config :hush,
  providers: [
    AwsSecretsManager,
    GcpSecretManager
  ]

config :hush_gcp_secret_manager,
  project_id: "hush-sample-app",
  goth: [name: HushSampleApp.GothHush]

config :sasl,
  sasl_error_logger: false

if File.exists?("#{__DIR__}/config.local.exs") do
  import_config "#{__DIR__}/config.local.exs"
end
