defmodule TrakkiTest do
  use ExUnit.Case
  doctest Trakki

  test "greets the world" do
    assert Trakki.hello() == :world
  end
end
