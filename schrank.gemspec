#coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'schrank/version'

Gem::Specification.new do |spec|
  spec.name          = 'schrank'
  spec.version       = Schrank::VERSION
  spec.authors       = ['Christof Dorner', 'Joe Corcoran']
  spec.email         = ['opensource@tape.tv']
  spec.summary       = 'Simply load YAML configuration files'
  spec.description   = %Q{A simple tool that helps you to load YAML config
files, with specifics to help you in development mode.
  }
  spec.homepage      = 'https://github.com/tape-tv/schrank'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '~> 4.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'yard', '~> 0.8'
end
