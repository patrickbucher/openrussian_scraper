defmodule Accent do
  @combining_accent "\u{0301}"

  def combine_accent(text, opts \\ [{:raw_accent, "'"}]) do
    String.replace(text, opts[:raw_accent], @combining_accent)
  end
end
