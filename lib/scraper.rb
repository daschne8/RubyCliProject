require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative "../lib/destination.rb"
class Scraper
    KAYAK = "https://www.kayak.com"

    def self.scrape
        html = open(KAYAK)
        doc = Nokogiri::HTML(html)
        #add section for div.CommonPersonalization-GenericDestinations (second scrolling section)
        doc.css("div.Common-Personalization-DestinationInfoBlock").each_with_index do |destination,index|
            #fix this ugly regex (was matching on rubular (/(mon|mon|...)\w*\s\d+/)but not here?)
            regex = destination.css("div")[2].text.scan(/Jan\w*\s\d+|Feb\w*\s\d+|Mar\w*\s\d+|Apr\w*\s\d+|May\w*\s\d+|Jun\w*\s\d+|Jul\w*\s\d+|Aug\w*\s\d+|Sep\w*\s\d+|Oct\w*\s\d+|Nov\w*\s\d+|Dec\w*\s\d+/)
            des_hash = {
            :location => destination.css("div")[0].text,
            :b_to_e => destination.css("div")[1].text.strip,
            :dates => "From #{regex[0]} -to-  #{regex[1]}.",
            :price => doc.css("div.Common-Personalization-DestinationLookUpBlock")[index].css("div._w")[0].text,
            :link => KAYAK+doc.css("div.Common-Personalization-Destination a.clickSection")[index]['href']
            }
            Destination.new(des_hash)
            # binding.pry
            # puts "done!"
        end
    end

    def self.scrape_flights(html)
        puts html
    end

end
