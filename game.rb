class PlayGame
    puts "Welcome!"

    def do_something
        while true
            separate

            print_map

            puts "\nWhat to do next?"

            action = gets.chomp

            puts "action = " + action

            if action == "quit"
                separate
                puts "Goodbye."
                break
            else
                puts "Action not found."
            end
        end
    end

    def separate
        puts "\n========================\n\n"
    end

    def print_map
        puts "| | | | | | | | | |"
        puts "| | | | | | | | | |"
        puts "| | | | | | | | | |"
        puts "| | | | |X| | | | |"
        puts "| | | | | | | | | |"
        puts "| | | | | | | | | |"
        puts "| | | | | | | | | |"
        puts "| | | | | | | | | |  X = you are here"
    end
end

this_game = PlayGame.new

this_game.do_something
