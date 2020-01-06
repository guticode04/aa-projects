require "piece.rb"
require "slideble.md"

class Rook < Piece 
    include Slideable

    def symbol
        '♖'.colorize(color)
    end

    protected 

    def move_dirs
        horizontal_and_vertical_dirs
    end

end