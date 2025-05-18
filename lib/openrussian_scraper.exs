defmodule OpenrussianScraper do
  @base_url "https://api.openrussian.org/api/wordlists"
  @levels ["A1", "A2", "B1", "B2", "C1", "C2"]
  @fetch_size 50

  def scrape(lang, level) when level in @levels do
    client = Req.new(base_url: @base_url)
    result = scrape(client, lang, level, 0, [])
    Enum.each(result, fn r -> IO.puts("\"#{Map.get(r, :ru)}\",\"#{Map.get(r, :de)}\"") end)
  end

  defp scrape(client, lang, level, offset, acc) when lang in ["en", "de"] do
    path = build_path(lang, level, offset)

    rows =
      Req.get!(client, url: path, headers: %{"accept" => ["application/json"]}).body
      |> get_in(["result", "entries"])
      |> Enum.map(fn entry ->
        %{
          ru: Map.get(entry, "accented") |> Accent.combine_accent(),
          de: Map.get(entry, "translations") |> format_translations
        }
      end)

    if Enum.count(rows) > 0 do
      acc = Enum.concat(acc, rows)
      scrape(client, lang, level, offset + @fetch_size, acc)
    else
      acc
    end
  end

  defp format_translations(items) do
    Enum.zip(1..Enum.count(items), items)
    |> Enum.map(fn {i, translation} -> "#{i}) #{String.replace(translation, "\"", "")}" end)
    |> Enum.join(" ")
  end

  defp build_path(lang, level, offset) do
    "/all?start=#{offset}&level=#{level}&lang=#{lang}"
  end
end

lang = Enum.fetch!(System.argv(), 0)
level = Enum.fetch!(System.argv(), 1)
OpenrussianScraper.scrape(lang, level)
