# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-ftp-deployer/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-ftp-deployer"
  spec.version       = Jekyll_Ftp_Deployer::VERSION
  spec.authors       = ["Evghenii Melnic"]
  spec.email         = ["melnic404@gmail.com"]

  spec.summary       = %q{Deploy, backup your jekyll site by FTP.}
  spec.description   = %q{Deploy, backup your jekyll site by FTP.}
  spec.homepage      = "https://github.com/af23me/jekyll-ftp-deployer"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency('colorize')
  spec.add_runtime_dependency('commander')
  spec.add_runtime_dependency('jekyll')

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bundler", "~> 1.14.a"
  spec.add_development_dependency "rake", "~> 10.0"
end
