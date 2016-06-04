defmodule FooTest do
  use ExUnit.Case
  import Bar.TestHelper

  test "ok" do
    assert hello == :world
  end
end
