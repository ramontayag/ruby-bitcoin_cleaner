# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitcoin_testnet/version'

Gem::Specification.new do |gem|
  gem.name          = "bitcoin_testnet"
  gem.version       = BitcoinTestnet::VERSION
  gem.authors       = ["Ramon Tayag"]
  gem.email         = ["ramon.tayag@gmail.com"]
  gem.description   = %q{A gem of helpers for making integration tests with the Bitcoin testnet a little easier.}
  gem.summary       = %q{A gem of helpers for making integration tests with the Bitcoin testnet a little easier.}
  gem.homepage      = ""

  testnet_files = `cd #{File.join(File.dirname(__FILE__), 'testnet')} && git ls-files`.split($/).map {|file| File.join('testnet', file)}
  gem.files         = `git ls-files`.split($/) + testnet_files
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'activesupport', '~> 3.0'
end
