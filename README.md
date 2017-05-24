# Rescrape

Welcome to Rescrape!

Project goals:
- [x] Refactor [ScrapeIndeed](https://github.com/nicholasbair/scrape_indeed) to include data persistence (SQLite3 + ActiveRecord)
- [x] Allow user to create and save searches
- [x] Gather data on a job's distance from home, commute time, and commute time with traffic (Google Maps API - directions & places)

## Installation

Rescrape is currently not available as a gem, to install:

1. Fork
2. Clone
3. CD into project directory
4. Create .env file in project root with format of [dotenv mock](dotenv_mock.md)
4. 'bundle install'
5. 'bundle'

## Usage

1. CD into bin
2. './bin/rescrape'

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nicholasbair/rescrape.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
