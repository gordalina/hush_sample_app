defmodule HushSampleApp.GothConfig do
  use Goth.Config

  def init(config) do
    creds = System.get_env(
      "GOOGLE_APPLICATION_CREDENTIALS",
      File.read!("priv/gcp_key.json")
    )

    {:ok, Keyword.put(config, :json, creds)}
  end
end
