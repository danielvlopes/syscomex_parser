require "bundler/gem_tasks"

require 'rake/testtask'
require 'rdoc/task'

desc 'Default: run unit specs.'
task :default => :spec

desc 'run unit tests'
Rake::TestTask.new(:spec) do |t|
  t.libs << 'lib'
  t.libs << 'spec'
  t.pattern = 'spec/**/*_spec.rb'
  t.verbose = true
end
