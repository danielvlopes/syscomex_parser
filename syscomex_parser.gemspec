# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require "syscomex/version"

Gem::Specification.new do |s|
  s.name        = "syscomex_parser"
  s.version     = SyscomexParser::VERSION
  s.authors     = ["Daniel Lopes"]
  s.email       = ["danielvlopes@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Ruby parser for Syscomex files}
  s.description = %q{Ruby parser to convert stupid txt files from Syscomex system (used on Brazilian IRS)}

  s.rubyforge_project = "syscomex_parser"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
