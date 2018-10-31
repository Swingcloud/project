defmodule Project.Repo do
  use Ecto.Repo, otp_app: :project, adapter: Ecto.Adapters.Postgres

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    {:ok, get_config(opts)}
  end

  defp get_config(config) do
    Enum.map(
      config,
      fn {key, value} ->
        case value do
          value ->
            {key, value}
        end
      end
    )
  end
end
