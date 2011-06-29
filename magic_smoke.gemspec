# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "magic_smoke/version"

Gem::Specification.new do |s|
  s.name        = "magic_smoke"
  s.version     = MagicSmoke::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Josh Price", "Matt Allen"]
  s.email       = ["josh@canoniq.com"]
  s.homepage    = ""
  s.summary     = %q{A magical smoke test suite for your rails app}
  s.description = %q{Checks that no routes in your app break}

  s.rubyforge_project = "magic_smoke"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
