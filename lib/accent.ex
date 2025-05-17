defmodule Accent do
  @raw_accent "'"
  @combining_accent "\u{0301}"

  def juxtapose_accent(word) do
    if String.contains?(word, @raw_accent) do
      [prefix, suffix] = String.split(word, @raw_accent, parts: 2)

      if String.length(prefix) > 0 do
        [last | rest_reversed] = prefix |> String.graphemes() |> Enum.reverse()
        combined = String.normalize(to_string([@combining_accent, last]), :nfc)
        Enum.join(Enum.reverse(rest_reversed), "") <> combined <> suffix
      else
        to_string([@combining_accent]) <> suffix
      end
    else
      word
    end
  end
end
