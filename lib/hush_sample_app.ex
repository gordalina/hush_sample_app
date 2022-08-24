defmodule HushSampleApp do
  @moduledoc """
  Documentation for `HushSampleApp`.
  """

  use Application

  def start(_type, _args1) do
    unless Hush.release_mode?(), do: Hush.resolve!()
    print_config()

    Task.async(fn -> System.halt(0) end)

    {:ok, self()}
  end

  @spec print_config :: any
  def print_config() do
    :hush_sample_app
    |> Application.get_all_env()
    |> Enum.reject(fn {app, _} -> app == :included_applications end)
    |> List.keysort(0)
    |> IO.inspect()
  end

  def add1(value), do: {:ok, value <> "1"}
end
