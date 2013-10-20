# -*- encoding: utf-8 -*-
require File.expand_path('../lib/render_csv/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Peter Brown"]
  gem.email         = ["github@lette.us"]
  gem.description   = "Adds a custom CSV renderer to Rails applications"
  gem.summary       = "Adds a custom CSV renderer to Rails applications"
  gem.homepage      = "http://github.com/beerlington/render_csv"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "render_csv"
  gem.require_paths = ["lib"]
  gem.version       = RenderCsv::VERSION

  gem.add_dependency('rails', '>= 3.0')

  gem.add_development_dependency('rspec-rails', '>= 2.12')
  gem.add_development_dependency('sqlite3', '>= 1.3')
  gem.add_development_dependency('json', '>= 1.6')

end
