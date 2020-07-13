module TroysTrips
    class CLI
        #def start
        #    puts "Hello! Its Working! Youre Super Cool!"
        def initialize
            @input = ""
          end
      
          def start 
            puts "Welcome to Troy's Trips! Powered by the TripAdvisor API"
            puts "Its a real weird time in the world right now.  Lets all stay safe, practice social distancing, and wear our masks"
            puts "Heres a way to find some cool hotels in some places you'd like to travel"
            set_location
            list_restaurants
            ask_for_choice
            while @input != "exit"
              if valid?
      
              else
                puts "Ahhhh! I didn't understand that, want to try again?"
              end
              ask_for_choice
            end
          end
      
          def set_location 
            puts "Where would you like to be magically whisked away to? (enter your desired city)"
            @location = gets.chomp
            Hotels.load_by_location(@location)
          end
        
          def list_hotels 
            Hotels.all.each.with_index(1) do |hotel, index|
              puts "#{index}. #{hotel.name}"
            end
          end
      
          def ask_for_choice
            list_choices
            @input = gets.strip
          end
      
          def list_choices 
            puts [
              "If you want to see more information about a hotel, simply type its number and press enter",
              "If you'd like to return to the main menu and do another search, type 'back'",
              "If you'd like to exit the program, simply type 'exit'"
            ]
          end
      
          def valid?
            @input.to_i.between?(1, Hotels.all.length)
        end
    end
end