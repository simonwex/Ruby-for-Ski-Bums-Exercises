#!/usr/bin/ruby

# Consider this part magic for now. We'll get to it in a later lesson
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

require 'pp'

# We'll make use of a little library I wrote for loading some weather data from the CAC
require 'real_time_weather_data'

data = RealTimeWeatherData.new(:rogers_pass)

puts "Here are the hours the data was captured from:"
puts data.hours.inspect
puts

puts "Here is a list of max wind speeds for each hour:"
puts data.max_wind_speeds.inspect

# Now I want you to try to output the time when the wind speeds 
# were at the highest for the 24-hour period. Ask .does_this_look_right?.
