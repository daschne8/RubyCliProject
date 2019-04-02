class Destination
    attr_accessor :location, :dates, :price,:b_to_e, :link, :flights
    @@all = []

    def initialize(attributes)
        attributes.each {|key,value| self.send(("#{key}="),value)}
        self.class.all << self
    end

    def self.all
        @@all
    end

    #you all seem to like the methods but i haven't found a use for them
    # def self.find_by_name(name)
    #   all.find {|selection| selection.location = name}
    # end
    #
    # def self.find_or_create_by_name(name)
    #   find_by_name(name) ||= Destination.new(name)
    # end
    #
    # def get_flights
    #     @flights = Scraper.scrape_flights(self.link)
    # end

    def display_info
      puts "#{location}"
      puts "flying #{b_to_e}"
      puts "from #{dates}"
      puts "starting at #{price}"
    end



end
