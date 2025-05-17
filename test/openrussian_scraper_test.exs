defmodule OpenrussianScraperTest do
  use ExUnit.Case
  doctest OpenrussianScraper

  test "greets the world" do
    assert OpenrussianScraper.hello() == :world
  end
end
