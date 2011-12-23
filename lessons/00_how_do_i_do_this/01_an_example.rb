#!/usr/bin/ruby

# Consider this part magic for now. We'll get to it in a later lesson
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

# Each lesson will have a result you'll want to check. 
# In this case, I want to make sure that we have a string, so when you run this:

3.does_this_look_right?
# => Nope, that's a Number

"This is a string, right?".does_this_look_right?
# => Good job, that looks like a string to me.

# You'll sometimes need to create variables and use those with the method:

my_string = "Rope"

my_string.does_this_look_right?
# => Good job, that looks like a string to me.