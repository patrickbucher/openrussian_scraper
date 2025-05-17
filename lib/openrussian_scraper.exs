defmodule OpenrussianScraper do
  # TODO: also support en.openrussian.org (command line arg)
  @base_url "https://de.openrussian.org"
  @levels ["A1", "A2", "B1", "B2", "C1", "C2"]
  @fetch_size 50

  def scrape(level) when level in @levels do
    client = Req.new(base_url: @base_url)
    result = scrape(client, level, 0, [])
    Enum.each(result, fn r -> IO.puts(r) end)
  end

  defp scrape(client, level, offset, acc) do
    path = build_path(level, offset)
    IO.puts(path)

    rows =
      Req.get!(client, url: path).body
      |> Floki.find("table.wordlist tr")
      |> Enum.map(&row_to_wordpair(&1))
      |> Enum.filter(fn pair -> Enum.count(pair) == 2 end)

    IO.inspect(rows)
    IO.puts("found #{Enum.count(rows)} rows")

    if Enum.count(rows) > 0 do
      acc = Enum.concat(acc, rows)
      scrape(client, level, offset + @fetch_size, acc)
    else
      acc
    end
  end

  defp row_to_wordpair(tr) do
    tds = Floki.find(tr, "td")

    if Enum.count(tds) >= 3 do
      ru =
        case Enum.fetch!(tds, 1) |> Floki.find("a") do
          [{"a", _, [russian]}] -> russian
          _ -> ""
        end

      de =
        case Enum.fetch!(tds, 2) |> Floki.find("p") do
          [{"p", _, _, german}] -> german
          _ -> ""
        end

      [ru, de]
    else
      []
    end
  end

  defp build_path(level, start) do
    "/vocab/#{level}?start=#{start}"
  end
end

System.argv() |> Enum.fetch!(0) |> OpenrussianScraper.scrape()
