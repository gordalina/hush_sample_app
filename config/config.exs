import Config

alias Hush.Provider.{
  AwsSecretsManager,
  GcpSecretManager,
  SystemEnvironment
}

config :goth,
  config_module: HushSampleApp.GothConfig

config :ex_aws,
  access_key_id: [{:system, "AWS_ACCESS_KEY_ID"}],
  secret_access_key: [{:system, "AWS_SECRET_ACCESS_KEY"}]

config :hush,
  providers: [
    GcpSecretManager
  ]

config :hush_gcp_secret_manager,
  project_id: "hush-sample-app"

config :hush_sample_app,
  aws_json: {:hush, AwsSecretsManager, "prod/db"},
  aws_key: {:hush, AwsSecretsManager, "prod/key"},
  gcp_foo: {:hush, GcpSecretManager, "foo"},
  gcp_bar: {:hush, GcpSecretManager, "bar"},
  env: {:hush, SystemEnvironment, "USER"},
  default: {:hush, SystemEnvironment, "THIS_ENV_DOES_NOT_EXIST", [default: "checks out"]},
  list: {:hush, SystemEnvironment, "USER"},
  list_nested: [
    level2: [
      user: {:hush, SystemEnvironment, "USER"}
    ]
  ],
  map: %{key: {:hush, SystemEnvironment, "USER"}},
  map_string: %{"key" => {:hush, SystemEnvironment, "USER"}},
  tuple: {{:hush, SystemEnvironment, "USER"}}

config :sasl,
  sasl_error_logger: false

if File.exists?("#{__DIR__}/config.local.exs") do
  import_config "#{__DIR__}/config.local.exs"
end
