#!/usr/bin/ruby

require 'rubygems'
require 'open-uri'
require 'hpricot'
require 'pp'

html_code = open('http://www.revelstokemountainresort.com/conditions/snow-report').read

doc = Hpricot(html_code)

all_the_spans = (doc / '.snow-report-table' / 'span.emph')
first_span = all_the_spans.first
puts first_span.inner_html
