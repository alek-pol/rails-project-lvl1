# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'

desc 'Run tests and rubocop'
task validate: %i[test rubocop]

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/test_*.rb']
  t.verbose    = false
end

require 'rubocop/rake_task'

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ['--display-cop-names']
end
