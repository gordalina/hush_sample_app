import Config

alias Hush.Provider.{
  AwsSecretsManager,
  GcpSecretManager,
  SystemEnvironment
}

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
  tuple: {{:hush, SystemEnvironment, "USER"}},
  apply: {:hush, SystemEnvironment, "USER", apply: fn x -> {:ok, x <> "1"} end}
