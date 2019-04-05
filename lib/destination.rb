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

    def flights
      Flight.all.select{|flight| flight.destination == self}
    end

    def display_info
      puts "#{location}"
      puts "flying #{b_to_e}"
      puts "from #{dates}"
      puts "starting at #{price}"
    end

end
