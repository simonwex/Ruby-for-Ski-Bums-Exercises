require 'open-uri'
require 'nokogiri'

class RealTimeWeatherData
  URLS = {
      :rogers_pass => 'http://www.avalanche.ca/feeds/glacier_dataloggers/data/RogersPassLast24Hof60M.htm'
    }
    
  TIME = 0
  MAX_TEMP = 1
  MIN_TEMP = 2
  RELATIVE_HUM = 3
  PRECIPITATION = 4
  WIND_DIRECTION = 5
  WIND_SPEED = 6
  MAX_WIND_SPEED = 7
    
  def initialize(key)
    raise ArgumentError.new("Key #{key} unknown.") unless URLS.include?(key)
        
    doc = Nokogiri::HTML(open(URLS[key]).read)
    cells = doc.xpath('//td')
    
    cells = cells[11..-1].map do |e| 
      if e.inner_text.to_i.to_s == e.inner_text
        e.inner_text.to_i
      else
        e.inner_text
      end
    end

    @rows = []
    24.times do |i|
      @rows[i] = cells[i*8..(i+1)*8-1]
    end

    @columns = @rows.transpose
  end
  
  def hours
    @columns[TIME]
  end
  
  def max_wind_speeds
    @columns[MAX_WIND_SPEED]
  end
end
