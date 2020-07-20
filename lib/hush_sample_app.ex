defmodule HushSampleApp do
  @moduledoc """
  Documentation for `HushSampleApp`.
  """

  use Application

  def start(_type, _args1) do
    Hush.resolve!()
    Application.get_all_env(:hush_sample_app) |> IO.inspect()

    {:ok, self()}
  end
end
