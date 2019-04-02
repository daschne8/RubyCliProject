class Flight
  attr_accessor :airline, :price, :time,:name

  @@all = []

  def initialize(attributes)
    attributes.each{|key,value| self.send(("#{key}="),value)}
    all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)

  end

  def self.find_or_create_by_name(name)

  end

  def self.cheapest_flight

  end

  def self.surprise_flight

  end

end
