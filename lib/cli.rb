class CLI
    attr_accessor

    def initialize
      Scraper.scrape
      intro
    end

    def run
      destinations
    end

    def intro
      puts "Welcome to your personalized travel reccommendations!"
      puts "Below is a list of destinations"
    end

    def destinations
      list_destinations
      user_input = gets.chomp
      puts ""
      if user_input == "exit"
        exit_program
      else
        if user_input.to_i <= Destination.all.length+1 && user_input.to_i > 0
          location_info(user_input)
        else
          puts "Please select valid input"
          destinations
        end
      end
    end

    def list_destinations
      puts ""
      Destination.all.each_with_index do |des,i|
        puts "#{i+1} #{des.location}"
      end
      puts ""
      puts "Select a number for more information \"exit\" to exit program"
    end

    def location_info(selection)
      Destination.all[selection.to_i - 1].display_info
      puts "\"f\" for flights, \"r\" to return, \"exit\" to leave program"
      user_input = gets.chomp
      case user_input
      when "f"
        Scraper.scrape_flights(Destination.all[selection.to_i - 1].link,Destination.all[selection.to_i - 1])
        destination_flights_listing(Destination.all[selection.to_i - 1])
      when "r"
        destinations
      when "exit"
        exit_program
      else
        puts "Sorry please make a valid selection"
        location_info(selection)
      end
    end

    def destination_flights_listing(destination)
      destination.flights.each_with_index do |flight,index|
        puts "#{index + 1}. #{flight.airline} flying to #{flight.destination.location}"
        puts "   #{flight.departure}"
        puts "   #{flight.arrival}"
        puts "   #{flight.price_range}"
      end
      puts ""
      destinations
    end

    def exit_program
      puts "Goodbye :("
    end

end
