require 'rake/testtask'
require 'pry'
Rake::TestTask.new(:test) do |t|
  require_relative 'controller'
  require_relative 'model'
  Dir.glob("**/controllers/*") { |f| require_relative(f) }
  Dir.glob("**/models/*") { |f| require_relative(f) }
  t.test_files = FileList['tests/test*.rb']
  t.verbose = true
end
task :default => :test
