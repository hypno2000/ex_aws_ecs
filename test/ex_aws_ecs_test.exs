defmodule ExAws.ECSTest do
  use ExUnit.Case
  doctest ExAws.ECS

  test "greets the world" do
    assert ExAws.ECS.hello() == :world
  end
end
