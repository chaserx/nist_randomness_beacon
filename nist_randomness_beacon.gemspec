# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nist_randomness_beacon/version'

Gem::Specification.new do |spec|
  spec.name          = "nist_randomness_beacon"
  spec.version       = NISTRandomnessBeacon::VERSION
  spec.authors       = ["Chase Southard"]
  spec.email         = ["chase.southard@gmail.com"]
  spec.summary       = %q{A wrapper for NIST Randomness Beacon}
  spec.description   = %q{A wrapper for the NIST Randomness Beacon
                          'cause sometimes you need to get
                          a 512-bit full-entropy bit-string programmaticlly.
                          You never know.}
  spec.homepage      = "https://github.com/chaserx/nist_randomness_beacon"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '> 2.0'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'awesome_print', '~> 1.2.0'
  spec.add_development_dependency 'yard', '~> 0.8.7.6'
  spec.add_development_dependency 'rspec', '~> 3.1.0'
  spec.add_development_dependency 'vcr', '~> 2.9.3'
  spec.add_development_dependency 'webmock', '~> 1.20.4'
  spec.add_development_dependency 'simplecov', '~> 0.9.1'
  spec.add_development_dependency 'timecop', '~> 0.7.1'

  spec.add_dependency 'httparty', '~> 0.13.3'
  spec.add_dependency 'json', '1.8.1'
end
