class AbstractWinningAlgorithm
    def initialize
    end
    
    def winMove?(lastMove, boardMatrix)
        index = lastMove.index
        i = index / 3
        j = index % 3
        marker = lastMove.marker
        win?(i, j, marker, boardMatrix);
    end
end