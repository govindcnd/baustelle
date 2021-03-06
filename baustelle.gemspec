# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'baustelle/version'

Gem::Specification.new do |spec|
  spec.name          = "baustelle"
  spec.version       = Baustelle::VERSION
  spec.authors       = ["Artur Roszczyk"]
  spec.email         = ["artur.roszczyk@gmail.com"]

  spec.summary       = %{Cloud Formation ochestration for ElasticBeanstalk}
  spec.description   = %{}
  spec.homepage      = ""
  spec.license       = "MIT"

  # # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions << "ext/jenkins_dsl/extconf.rb"

  spec.add_dependency "activesupport", "~> 4.2.5"
  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "aws-sdk"
  spec.add_dependency "jenkins_api_client", "~> 1.5.3"
  spec.add_dependency "rschema", "~> 1.3.0"


  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
end
