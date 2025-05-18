# Openrussian Scraper

Scrape frequency lists from OpenRussian.org

Fetch frequency list for German (`de`) translations for level A1:

    mix run lib/openrussian_scraper.exs de A1 > ru-de-a1.csv

Fetch frequency list for English (`en`) translations for level B2:

    mix run lib/openrussian_scraper.exs en B2 > ru-en-b2.csv

**Note**: A higher list (e.g. B2) does _not_ contain the words of the lower lists (e.g. A1, A2, B1).

## TODO

- [ ] Write an additional script that processes a CSV file.
