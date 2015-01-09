# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'emay_soap/version'

Gem::Specification.new do |spec|
  spec.name          = "emay_soap"
  spec.version       = EmaySoap::VERSION
  spec.authors       = ["Yuan He"]
  spec.email         = ["lendage@gmail.com"]
  spec.summary       = %q{Emay SOAP API wrapper in Ruby.}
  spec.description   = %q{Made easy to use Emay(http://www.emay.cn/) to send sms in Ruby.}
  spec.homepage      = "https://github.com/lenage/emay_soap"
  spec.license       = "MIT"

  spec.add_runtime_dependency 'savon', '~> 2.8'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'pry'
end
