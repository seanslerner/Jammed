#!/usr/bin/env rake

require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require File.expand_path('../lib/jammed/version', __FILE__)
require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name          = "jammed"
  gem.homepage      = "https://github.com/seanslerner/Jammed"
  gem.license       = "MIT"
  gem.summary       = %q{A Ruby wrapper for This Is My Jam's API}
  gem.description   = %q{Jammed wraps the This Is My Jam API. More information about the This Is My Jam API can be found on their website (http://www.thisismyjam.com/developers).}
  gem.email         = ["seanslerner@gmail.com"]
  gem.authors       = ["Sean Lerner", "Rob Young", "Mike Chlipala"]
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.version       = Jammed::VERSION
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
task default: :spec