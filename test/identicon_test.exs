defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon

  test "greets the world" do
    assert Identicon.hello() == :world
  end
end
