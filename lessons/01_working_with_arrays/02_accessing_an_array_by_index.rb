#!/usr/bin/ruby

# Consider this part magic for now. We'll get to it in a later lesson
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

# Here we have an array of strings:
an_array = ['beacon', 'shovel', 'probe', 'headlamp']

# Arrays have indexes, think of them as the position of an item in the array
# Indexes start at 0, not 1.

# To access an item in the array, use square brackets and a number, like so:
item = an_array[3]
puts "This is what is at index 3: \"#{item}\"\n\n"

# Access the string 'shovel' by using an index and ask .does_this_look_right? on your item:
