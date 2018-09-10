defmodule ExAws.ECS do
  @moduledoc """
  Operations on AWS ECS
  https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_Operations.html
  """

  import ExAws.Utils, only: [camelize_keys: 1, upcase: 1]
  require Logger

  @namespace "AmazonEC2ContainerServiceV20141113"

  ## Clusters
  ######################

  @type cluster_name :: binary

  @doc "Lists clusters"
  @spec list_clusters() :: ExAws.Operation.JSON.t
  def list_clusters() do
    request(:list_clusters, %{})
  end

  defp request(action, data, opts \\ %{}) do
    operation =
      action
      |> Atom.to_string
      |> Macro.camelize

    ExAws.Operation.JSON.new(:ecs, %{
      data: data,
      headers: [
        {"x-amz-target", "#{@namespace}.#{operation}"},
        {"content-type", "application/x-amz-json-1.1"}
      ]
    } |> Map.merge(opts))
  end
end
