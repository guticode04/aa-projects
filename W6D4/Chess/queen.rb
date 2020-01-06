require "piece.rb"
require "slideable"

class Queen < Piece
    include Slideable

    def symbol
        '♕'.colorize(color)
    end

    protected
    
    def move_dirs
        diagonal_dirs + horizontal_and_vertical_dirs
    end
end
