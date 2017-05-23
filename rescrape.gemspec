# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rescrape/version'

Gem::Specification.new do |spec|
  spec.name          = "rescrape"
  spec.version       = Rescrape::VERSION
  spec.authors       = ["Nick Bair"]
  spec.email         = ["bairinc@gmail.com"]

  spec.summary       = %q{Scrape job sites for data}
  spec.description   = %q{See above}
  spec.homepage      = "https://github.com/nicholasbair/rescrape"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry", "~> 0.10.0"
  spec.add_dependency "axlsx", "~> 2.0"
  spec.add_dependency "colorize", "~> 0.8.0"
  spec.add_dependency "nokogiri", "~> 1.6.8"
  spec.add_dependency "dotenv", "~> 2.2.1"
  spec.add_dependency "sqlite3", "~> 1.3"
  spec.add_dependency "activerecord", "~> 5.1.1"
  spec.add_dependency "httparty", "~> 0.15.5"
  spec.add_dependency "require_all", "~> 1.4.0"
end
