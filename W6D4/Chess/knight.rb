require "piece.rb"
require "stepable"

class Knight < Piece
    include Stepable

    def symbol
        '♘'.colorize(color)
    end

    protected
    
    def move_diffs
        [[-2,-1],
        [-1,-2],
        [-2,1],
        [-1,2],
        [1, -2],
        [2,-1],
        [1,2],
        [2,1]]
    end

end
