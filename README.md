# Rescrape

Welcome to Rescrape!  A CLI job scraper with data persistence, write to excel, and Google Maps integration for commute data.


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
5. $ rake db:migrate
6. $ rake db:seed

## Usage

1. From project directory => $ ./bin/rescrape
2. Follow CLI prompt

### Usage Notes:
- All of the Google Maps APIs used in this project allow use for free
  - All have request quotas -> one as low as 1000/day
  - If your searches are broad, you may hit your cap quickly!
  - One of the main goals of this project is to aggregate commute times based on job results
  - If a search is ran and the Google Maps API is capped, the jobs will not be added to the database
  - In the future this will raise an exception, see issue [#40](https://github.com/nicholasbair/rescrape/issues/40)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nicholasbair/rescrape.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
