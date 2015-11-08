# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/mackerel/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-mackerel"
  spec.version       = Ruboty::Mackerel::VERSION
  spec.authors       = ["mizokami"]
  spec.email         = ["r.mizokami@gmail.com"]

  spec.summary       = %q{Ruboty plugin for Mackerel.}
  spec.description   = %q{Ruboty plugin for Mackerel.}
  spec.homepage      = "https://github.com/mizoR/ruboty-mackerel"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "mackerel-rb"
  spec.add_dependency "terminal-table"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "ruboty"
  spec.add_development_dependency "dotenv"
end
