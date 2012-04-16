# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jammed/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sean Lerner", "Rob Young", "Mike Chlipala"]
  gem.email         = ["seanslerner@gmail.com"]
  gem.description   = %q{A ruby wrapper for This Is My Jam's API}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = "https://github.com/seanslerner/Jammed"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "jammed"
  gem.require_paths = ["lib"]
  gem.version       = Jammed::VERSION

  gem.add_runtime_dependency "httparty"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "webmock"
  gem.add_development_dependency "cucumber"
end