defmodule HushSampleApp do
  @moduledoc """
  Documentation for `HushSampleApp`.
  """

  use Application

  def start(_type, _args1) do
    unless Hush.release_mode?, do: Hush.resolve!()
    print_config()

    {:ok, self()}
  end

  def start_eval() do
    Application.ensure_loaded(:hush_sample_app)
    print_config()
  end

  def print_config() do
    :hush_sample_app
    |> Application.get_all_env()
    |> Enum.reject(fn ({app, config}) -> app == :included_applications end)
    |> List.keysort(0)
    |> IO.inspect()
  end
end
