require "./Player"
require "./Board"
require "./WinningAlgorithm"

class GameController
    def initialize
        puts "Welcome to tic-tac-toe game !!!"
    end

    def getInfo
        while true do
            puts "enter player 1 name"
            player1Name = gets.chop
            puts "enter marker for player 1"
            player1Marker = gets.chop

            puts "enter player 2 name"
            player2Name = gets.chop
            puts "enter marker for player 2"
            player2Marker = gets.chop
            
            if player1Name != player2Name && player1Marker != player2Marker
                @player1 = Player.new(player1Name, player1Marker)
                @player2 = Player.new(player2Name, player2Marker)
                break;
            else
                puts "players information has to be unique";
            end
        end
    end

    def start
        getInfo
        winning_algorithm = WinningAlgorithm.new 
        @board = Board.new winning_algorithm
        play
    end

    def play
        system "clear"
        turn = 1 # 1 player1, 2 player2

        while true
            system "clear"
            @board.render 
            res = @board.gameOver?
            if res == -1
                puts "******** Draw ********"
                break
            elsif res == @player1.marker 
                puts "******** winner is : #{@player1.name} ********"
                break
            elsif res == @player2.marker 
                puts "******** winner is : #{@player2.name} ********"
                break
            end


            marker = ""
            if turn == 1
                puts "-#{@player1.name} choose empty cell to place your marker"
                marker = @player1.marker
            else
                puts "-#{@player2.name} choose empty cell to place your marker"
                marker = @player2.marker
            end

            invalidPos = true
            while invalidPos do
                index = gets.to_i
                begin
                    invalidPos = false
                    @board.placeMarker(index, marker)
                rescue => e 
                    puts e
                    invalidPos = true
                end
            end
        
            turn = 3 - turn  # switch players
        end


        puts "play again ? 1/0"
        yes = gets.to_i
        if yes == 1
            start
        end
    end

end