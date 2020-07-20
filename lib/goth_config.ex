defmodule HushSampleApp.GothConfig do
  use Goth.Config

  def init(config) do
    {:ok, Keyword.put(config, :json, credentials("priv/gcp_key.json"))}
  end

  defp credentials(path) do
    if File.exists?(path) do
      File.read!(path)
    else
      System.get_env("GOOGLE_APPLICATION_CREDENTIALS")
    end
  end
end
