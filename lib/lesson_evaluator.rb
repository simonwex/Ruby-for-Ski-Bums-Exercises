require 'active_support/inflector'

$lesson_passed = nil

module Lessons    
  module HowDoIDoThis
    def self.an_example(s)
      if s.is_a?(String)
        puts "Good job, that looks like a string to me."
        $lesson_passed ||= true
      else
        puts "Nope, that's a #{s.class}"
      end
    end
  end
  module WorkingWithArrays
    def self.create_an_array(a)
      if a.is_a?(Array)
        if a.size == 4
          puts "Looks good to me: "
          puts "\t#{a.inspect}.size"
          puts "\t=> 4"
          $lesson_passed ||= true
        else
          puts "It looks like you've got an array, but it has #{a.size} elements, not 4."
        end
      else
        puts "Are you sure you've got an array?"
      end
    end
    def self.accessing_an_array_by_index(e)
      if e == 'shovel'
        puts "Looks good to me."
        $lesson_passed ||= true
      else
        puts "Not quite, you passed in #{e}"
      end
    end
    def self.adding_to_an_array(a)
      if a == [:a, :b, :c, :d, :e]
        puts "Looks good to me: #{a.inspect}"
        $lesson_passed ||= true
      else
        puts "Not quite, this is what you have: #{a.inspect}"
      end
    end
    
    def self.working_with_real_data(date)
      data = RealTimeWeatherData.new(:rogers_pass)
      if date == data.hours[data.max_wind_speeds.index(data.max_wind_speeds.max)]
        puts "Looks good to me: #{date}"
        $lesson_passed ||= true
      else
        puts "Not quite, this is what you have: #{date}, I've got #{data.hours[data.max_wind_speeds.index(data.max_wind_speeds.max)]}"
      end
    end
  end
end

class Object
  def does_this_look_right?
    $lesson_passed ||= false
    File.expand_path($0) =~ /\d\d_(.*?)#{File::SEPARATOR}\d\d_(.*?)\.rb$/
    Lessons.module_eval(ActiveSupport::Inflector.camelize($1)).send($2.to_sym, self)
  end
end

at_exit do
  exit if $!
    
  if $lesson_passed.nil?
    puts "You didn't call .does_this_look_right? on any of your objects. Try looking at lesson 01_an_example."
    puts
  end
  
  puts "Press enter to continue or exit."
  gets
end
