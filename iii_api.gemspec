# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iii_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'iii_api'
  spec.version       = IiiApi::VERSION
  spec.authors       = ['Andrey Grigorenko']
  spec.email         = ['learningisalife@gmail.com']
  spec.summary       = %q{Simple ruby api for using iii.ru bot}
  spec.homepage      = 'https://github.com/GriwMF/iii_api'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'vcr'
  spec.add_runtime_dependency 'faraday'
end
