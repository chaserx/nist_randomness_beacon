# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nist_randomness_beacon/version'

Gem::Specification.new do |spec|
  spec.name          = "nist_randomness_beacon"
  spec.version       = NISTRandomnessBeacon::VERSION
  spec.authors       = ["Chase Southard", "Sarah Vessels"]
  spec.email         = ["chase.southard@gmail.com"]
  spec.summary       = %q{A wrapper for the National Institute of Standards and Technology (NIST) Randomness Beacon.}
  spec.description   = %q{A wrapper for the National Institute of Standards and Technology (NIST) Randomness Beacon 'cause sometimes you need to get a 512-bit full-entropy bit-string programmatically. You never know.}
  spec.homepage      = "https://github.com/chaserx/nist_randomness_beacon"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ['>= 2.2.0', '=< 2.5.0']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 11.2'
  spec.add_development_dependency 'awesome_print', '~> 1.7'
  spec.add_development_dependency 'yard', '~> 0.9.12'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'vcr', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 2.1'
  spec.add_development_dependency 'simplecov', '~> 0.12'
  spec.add_development_dependency 'timecop', '~> 0.8'

  spec.add_dependency 'httparty', '~> 0.15.6'
  spec.add_dependency 'json', '~> 2.1'
end
