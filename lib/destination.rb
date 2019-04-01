class Destination
    attr_accessor :location, :dates, :price,:b_to_e
    @@all = []

    def initialize(attributes)
        attributes.each {|key,value| self.send(("#{key}="),value)}
        self.class.all << self
    end

    def self.all
        @@all
    end

end
