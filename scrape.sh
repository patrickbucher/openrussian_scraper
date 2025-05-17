#!/usr/bin/env bash

mkdir export

mix run lib/openrussian_scraper.exs de A1 > export/ru-de-a1.csv
mix run lib/openrussian_scraper.exs de A2 > export/ru-de-a2.csv
mix run lib/openrussian_scraper.exs de B1 > export/ru-de-b1.csv
mix run lib/openrussian_scraper.exs de B2 > export/ru-de-b2.csv
mix run lib/openrussian_scraper.exs de C1 > export/ru-de-c1.csv
mix run lib/openrussian_scraper.exs de C2 > export/ru-de-c2.csv

mix run lib/openrussian_scraper.exs en A1 > export/ru-en-a1.csv
mix run lib/openrussian_scraper.exs en A2 > export/ru-en-a2.csv
mix run lib/openrussian_scraper.exs en B1 > export/ru-en-b1.csv
mix run lib/openrussian_scraper.exs en B2 > export/ru-en-b2.csv
mix run lib/openrussian_scraper.exs en C1 > export/ru-en-c1.csv
mix run lib/openrussian_scraper.exs en C2 > export/ru-en-c2.csv
