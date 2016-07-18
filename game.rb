class PlayGame
    def initialize
        require "colorize"
        create_map

        clear_screen
        print_map
        get_action
    end

    def create_map
        @the_map = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        @you_are_here = 5
    end

    ####################

    def clear_screen
        system "clear"
    end

    def print_and_flush(str)
        print str
        $stdout.flush
    end

    ####################

    def get_action
        print_and_flush "\nWhat to do next? ".green
        @action = gets.chomp
        do_action
    end

    def print_map
        grid = []

        @the_map.length.times do |i|

            if @you_are_here == i
                tile = "X"
            elsif @the_map[i] == 0
                tile = " "
            else
                tile = "?"
            end

            grid.push(tile)
        end

        puts "Map: ---------------- \n|".blue +
            grid.join("") +
            "|\n -------------------- ".blue
    end

    def do_action
        if @action == "quit"
            clear_screen
            print_map
            puts "\nGoodbye.\n".yellow
        elsif @action == "help"
            clear_screen
            print_map
            give_help
            get_action
        elsif @action == "jump"
            clear_screen
            print_map
            puts "\nJump!".yellow

            @you_are_here += 1

            if @you_are_here >= @the_map.length
                @you_are_here = 0
            end

            get_action
        else
            clear_screen
            print_map
            puts "\nAction '#{@action}' not found.".red
            give_help
            get_action
        end
    end

    def give_help
        puts ["\nActions:","help","jump","quit"].join("\n  - ").yellow
    end
end

this_game = PlayGame.new

# MVS's project = https://github.com/smellsblue/holmes



