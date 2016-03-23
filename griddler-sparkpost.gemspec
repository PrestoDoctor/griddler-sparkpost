# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'griddler/sparkpost/version'

Gem::Specification.new do |spec|
  spec.name          = 'griddler-sparkpost'
  spec.version       = Griddler::Sparkpost::VERSION
  spec.authors       = ['Kyle Powers']
  spec.email         = ['kylepowers@gmail.com']
  spec.summary       = 'SparkPost adapter for Griddler'
  spec.description   = 'Adapter to allow the use of SparkPost Inbound Email Relay with Griddler'
  spec.homepage      = 'https://github.com/PrestoDoctor/griddler-sparkpost'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'

  spec.add_runtime_dependency 'griddler'
  spec.add_runtime_dependency 'mail'
end
