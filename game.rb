class PlayGame
    def initialize
        puts "\nWelcome!"
        create_map
        play_game
    end

    def play_game
        # while true
        separate

        print_map

        get_action

        if @action == "quit"
            # break
        elsif @action == "help"
            give_help
        elsif @action == "jump"
            @you_are_here += 1

            if @you_are_here >= @the_map.length
                @you_are_here = 0
            end
        else
            puts "Action not found."
        end

        # break
        # end

        separate
        puts "Goodbye.\n\n"
    end

    def get_action
        puts "\nWhat to do next?"
        @action = gets.chomp
        puts "action = " + @action
        do_action
    end

    def do_action
    end

    def give_help
        puts ["\nActions:","help","jump","quit"].join("\n  - ")
    end

    def separate
        puts "\n========================\n\n"
    end

    def create_map
        @the_map = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        @you_are_here = 5
    end

    def print_map
        tester = []

        @the_map.length.times do |i|

            if @you_are_here == i
                tile = "X"
            elsif @the_map[i] == 0
                tile = " "
            else
                tile = "?"
            end

            tester.push(tile)
        end

        puts "Map:\n -------------------- \n|" + tester.join("") + "|\n -------------------- "
    end
end

this_game = PlayGame.new

# MVS's project = https://github.com/smellsblue/holmes



