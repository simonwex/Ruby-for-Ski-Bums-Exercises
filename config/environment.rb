$: << File.expand_path(File.dirname(__FILE__) + '/../lib')

# This means we're executing a lesson, so we're going to load lesson stuff
if File.expand_path($0) =~ /lessons#{File::SEPARATOR}\d\d/
  require 'lesson_evaluator'
end