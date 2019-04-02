require_relative '../lib/destination.rb'
require_relative '../lib/scraper.rb'
require_relative '../lib/cli.rb'
require_relative '../lib/flight.rb'

require 'watir'
require 'webdrivers'
require 'pry'

cli = CLI.new
cli.run

# br = Watir::Browser.start("https://www.kayak.com/flights/WAS-FCO/2019-10-20/2019-10-31")
# doc = Nokogiri::HTML(br.html)

# binding.pry
