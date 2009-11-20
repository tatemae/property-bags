require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the property_bags gem.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test/rails_root/test'
  t.pattern = 'test/rails_root/test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the property_bags gem.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Property Bags'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc 'Translate this gem'
task :translate do
  file = File.join(File.dirname(__FILE__), 'locales', 'en.yml')
  system("babelphish -o -y #{file}")
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "property_bags"
    gemspec.summary = "Add any number of properties to any model"
    gemspec.email = "justinball@gmail.com,joel.duffin@gmail.com"
    gemspec.homepage = "http://github.com/jbasdf/property_bags"
    gemspec.description = "Add unlimited properties to your models.  Ya, this is like a totally denormalized database."
    gemspec.authors = ["Justin Ball", "Joel Duffin"]
    gemspec.files.include %w( test/rails_root/db/schema.rb )
    gemspec.rubyforge_project = 'property_bags'
  end
  Jeweler::GemcutterTasks.new
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = "rdoc"
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end
