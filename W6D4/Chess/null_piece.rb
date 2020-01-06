require './piece.rb'
require 'singleton'

class NullPiece < Piece 
  include Singleton

  attr_reader :symbol

  def initialize
    @symbol = " "
    @color = :none
  end
  
  def empty?
    true
  end

  def moves
    []
  end

end