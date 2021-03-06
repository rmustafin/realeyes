# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'realeyes/version'

Gem::Specification.new do |spec|
  spec.name          = "realeyes"
  spec.version       = Ruby::Realeyes::VERSION
  spec.authors       = ["Ramil Mustafin"]
  spec.email         = ["rommel.rmm@gmail.com"]
  spec.summary       = %q{Ruby client for realeyes reporting api}
  spec.description   = %q{}
  spec.homepage      = "http://github.com/rmustafin/realeyes"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "timecop"
end
