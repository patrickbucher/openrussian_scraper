#!/usr/bin/env bash

mkdir scraped

mix run lib/openrussian_scraper.exs de A1 > scraped/ru-de-a1.csv
mix run lib/openrussian_scraper.exs de A2 > scraped/ru-de-a2.csv
mix run lib/openrussian_scraper.exs de B1 > scraped/ru-de-b1.csv
mix run lib/openrussian_scraper.exs de B2 > scraped/ru-de-b2.csv
mix run lib/openrussian_scraper.exs de C1 > scraped/ru-de-c1.csv
mix run lib/openrussian_scraper.exs de C2 > scraped/ru-de-c2.csv

mix run lib/openrussian_scraper.exs en A1 > scraped/ru-en-a1.csv
mix run lib/openrussian_scraper.exs en A2 > scraped/ru-en-a2.csv
mix run lib/openrussian_scraper.exs en B1 > scraped/ru-en-b1.csv
mix run lib/openrussian_scraper.exs en B2 > scraped/ru-en-b2.csv
mix run lib/openrussian_scraper.exs en C1 > scraped/ru-en-c1.csv
mix run lib/openrussian_scraper.exs en C2 > scraped/ru-en-c2.csv
