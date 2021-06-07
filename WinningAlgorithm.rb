require './AbstractWinningAlgorithm.rb'


class WinningAlgorithm < AbstractWinningAlgorithm
    def win? i, j, marker, boardMatrix
        if rowWin(i, marker, boardMatrix) == true
            puts "row win"
            true
        elsif colWin(j, marker, boardMatrix)
            puts "col win"
            true 
        elsif mainDiagonalWin(marker, boardMatrix)
            puts "main diagonal win"
            true
        elsif offDiagonalWin(marker, boardMatrix)
            puts "off diagonal win"
            true 
        else
            false
        end
    end

    def rowWin(i, marker, boardMatrix)
        j = 0 
        while j < 3 do 
            if boardMatrix[i][j] != marker
                return false
            end 
            j+=1
        end

        true
    end

    def colWin(j, marker, boardMatrix)
        i = 0
        while i < 3 do
            if boardMatrix[i][j] !=marker
                return false 
            end
            i +=1
        end
        true 
    end

    def mainDiagonalWin(marker, boardMatrix)
        i = 0 
        j = 0
        while i < 3 && j < 3 do 
            if boardMatrix[i][j] != marker
                return false 
            end
            i +=1
            j +=1
        end
        
        true
    end

    def offDiagonalWin(marker, boardMatrix)
        i = 0
        j = 2 
        while i < 3 && j>=0 do 
            if boardMatrix[i][j] != marker 
                return false 
            end
            i +=1
            j -=1
        end

        true
    end 
end