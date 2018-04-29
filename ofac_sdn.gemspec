# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ofac_sdn/version'

Gem::Specification.new do |spec|
  spec.name          = 'ofac_sdn'
  spec.version       = OfacSdn::VERSION
  spec.authors       = ['Bryam Noguera']
  spec.email         = ['bryam@primetrust.com']

  spec.summary       = 'Returns a hash for the OFAC sdn.xml'
  spec.homepage      = 'https://github.com/csebryam/ofac-sdn'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_runtime_dependency 'nokogiri', '~> 1.8.0'
end
