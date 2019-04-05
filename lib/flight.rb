class Flight
  attr_accessor :airline,:price_range,:arrival,:departure,:destination

  @@all = []

  def initialize(attributes)
    attributes.each{|key,value| self.send(("#{key}="),value)}
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.cheapest_flight
    cheap_flight = all[0]
    cheapest_price = all[0].price_range.scan(/\d+/)[0]
    all.each do |flight|
      if flight.price_range.scan(/\d+/)[0] < cheapest
        cheap_flight = flight
        cheapest_price = flight.price_range.scan(/\d+/)[0]
      end
    end
    return cheap_flight
  end

  def self.surprise_flight
    all[rand(0..all.length)]
  end

  # def self.all_by_destination(destination)
  #   all.select{|flight| flight.destination == destination}
  # end

end
