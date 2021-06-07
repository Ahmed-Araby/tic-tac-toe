require_relative 'Move'

class Board
    
    def initialize(winningAlogrithm)
        @board = Array.new(3) {Array.new(3)}
        @markersCnt = 0
        @winning_algorithm = winningAlogrithm # obj
        @last_move = Move.new(-1,"");
        
        init
    end

    def render
        i = 0

        line
        while i < 3 do
            j = 0
            
            print "|"
            while j < 3 do 
                print @board[i][j]
                print "|"
                j+=1
            end
            line

            i+=1
        end
        puts
    end

    def placeMarker(index, marker)
        raise "invalid position" unless index.class == Integer
        raise "inalid position"  unless index >=1 && index <=9

        index -=1;
        i = index / 3
        j = index  % 3 
        if @board[i][j] != index +1
            raise  StandardError, "position is already markerd";
        else
            @board[i][j] = marker 
            @markersCnt += 1
            @last_move.setMove(index, marker)
        end 
    end

    def gameOver?
        if @last_move.index == -1
           return false 
        end

        win = @winning_algorithm.winMove?(@last_move, @board)
        if win == true
            return @last_move.marker
        elsif @markersCnt == 9
            return -1  # draw
        end

        false
    end

    private
    
    def line
        puts "\n+-+-+-+"
    end

    def init
        i = 0
        index = 1
        while i < 3 do
            j = 0
            while j < 3 do 
                @board[i][j] = index
                j+=1
                index +=1
            end
            i+=1
        end
    end
end