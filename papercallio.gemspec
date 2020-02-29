# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','papercallio','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'papercallio'
  s.version = Papercallio::VERSION
  s.author = 'aaronblythe'
  s.email = 'aaron.blythe@gmail.com'
  s.licenses = ['Apache-2.0']
  s.homepage = 'http://aaronblythe.org'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Gem to use the papercallio API'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.bindir = 'bin'
  s.executables << 'papercallio'
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rdoc', '~> 5.1'
  s.add_development_dependency 'aruba', '~> 0.14'
  s.add_development_dependency 'rspec', '~> 3.6'
  s.add_runtime_dependency 'gli', '2.16.0'
  s.add_runtime_dependency 'httparty', '~> 0.15'
  s.add_runtime_dependency 'descriptive_statistics', '~> 2.5'
end
