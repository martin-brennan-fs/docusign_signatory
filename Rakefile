require 'minitest/autorun'
require 'rake/testtask'

# Add the test directory to rake
Rake::TestTask.new do |t|
  t.libs << 'test'
end

# Run the tests as a default task
desc "Run tests"
task :default => :test