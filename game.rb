class PlayGame
    def initialize
        require "colorize"
        create_map

        clear_screen
        print_map
        get_action
    end

    def create_map
        @grass = 0
        @water = 1
        @snow = 2

        @the_map = [
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
            [0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,2,2],
            [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,2,2,2],
            [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,2,2],
            [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,2,2,2],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,2,2,2],
            [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2]
        ]

        @you_are_here_row = 0
        @you_are_here_col = 5

        @the_map.length.times do |i|
            @the_map[i].length.times do |j|

                number = @the_map[i][j]

                if number == 0
                    terrain = "░".green
                elsif number == 1
                    terrain = "░".blue
                elsif number == 2
                    terrain = "░".white
                else
                    terrain = "?"
                end

                @the_map[i][j] = terrain
            end
        end
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

        paint = "╔".blue

        (@the_map[0].length + 2).times do |i|
            paint += "═".blue
        end

        paint += "╗\n".blue

        @the_map.length.times do |i|

            paint += "║ ".blue

            @the_map[i].length.times do |j|

                if @you_are_here_row == i && @you_are_here_col == j
                    tile = "☓".red
                else
                    tile = @the_map[i][j]
                end

                paint += tile
            end

            paint += " ║\n".blue
        end

        paint += "╚".blue

        (@the_map[0].length + 2).times do |i|
            paint += "═".blue
        end

        paint += "╝".blue

        puts paint
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

            @you_are_here_col += 1

            if @you_are_here_col >= @the_map[0].length
                @you_are_here_col = 0
            end

            print_map
            puts "\nJump!".yellow

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

PlayGame.new

# MVS's project = https://github.com/smellsblue/holmes



