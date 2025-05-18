defmodule CsvAccentuation do
  def accentuate(input_file, accent_char, output_file) do
    csv =
      File.stream!(input_file)
      |> CSV.decode()
      |> Stream.map(fn
        {:ok, [orig, trans]} -> [Accent.combine_accent(orig, raw_accent: accent_char), trans]
        _ -> {}
      end)
      |> Stream.filter(fn e -> Enum.count(e) > 0 end)
      |> CSV.encode()
      |> Enum.join()

    File.write!(output_file, csv)
  end
end

[input_file, accent_char, output_file] = System.argv()
CsvAccentuation.accentuate(input_file, accent_char, output_file)
