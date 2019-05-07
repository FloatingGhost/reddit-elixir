defmodule RedditTest do
  use ExUnit.Case
  doctest Reddit

  test "greets the world" do
    assert Reddit.hello() == :world
  end
end
