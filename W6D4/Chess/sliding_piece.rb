require './piece.rb'

class SlidingPiece < Piece

  attr_reader :symbol
  
  def initialize(symbol,color,board, pos)
    @symbol = symbol
    super(color,board,pos)
  end


end