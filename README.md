# Rescrape

Welcome to Rescrape!  A CLI job scraper with data persistence, write to excel capabilities, and integration to Google Maps for commute data.


## Project goals
- [x] Refactor [ScrapeIndeed](https://github.com/nicholasbair/scrape_indeed) to include data persistence (SQLite3 + ActiveRecord)
- [x] Allow user to create and save searches
- [x] Gather data on a job's distance from home, commute time, and commute time with traffic (Google Maps API - directions & places)


## Installation

Rescrape is currently not available as a gem, to install:

1. Fork
2. Clone
3. CD into project directory
4. Create .env file in project root with format of [dotenv mock](dotenv_mock.txt)
4. $ bundle


## Usage

1. From project directory => $ ./bin/rescrape


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nicholasbair/rescrape.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
