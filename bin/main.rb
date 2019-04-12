require_relative '../lib/destination.rb'
require_relative '../lib/scraper.rb'
require_relative '../lib/cli.rb'
require_relative '../lib/flight.rb'

require "open-uri"
require 'watir'
require 'webdrivers'
require 'pry'

cli = CLI.new
cli.run
# d_hash = {location: "Rome"}
# d = Destination.new(d_hash)
# Scraper.scrape_flights("www.kayak.com/f;ight/WAS-FCO/2019-10-20/2019-10-31",d)
# fls = Flight.all_by_destination(d)

# binding.pry
