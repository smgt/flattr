# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "flattr/version"

Gem::Specification.new do |s|
  s.name        = "flattr"
  s.version     = Flattr::Version.to_s
  s.authors     = ["Simon Gate", "Joel Hansson"]
  s.email       = ["simon@smgt.me", "joel.hansson@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Write a gem summary}
  s.description = %q{Write a gem description}

  s.rubyforge_project = "flattr"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'faraday'
  s.add_dependency 'multi_json'

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
