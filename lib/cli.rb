require_relative '../lib/destination.rb'
require_relative '../lib/scraper.rb'

require 'pry'

class CLI
    attr_accessor

    def run
      Scraper.scrape
      self.list_destinations
    end

    def list_destinations
      Destination.all.each_with_index do |des,i|
        puts "#{i+1} #{des.location}"
      end
    end

end


c = CLI.new

binding.pry
puts "Done!"
