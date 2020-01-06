module Slideable
  HORIZONTAL_AND_VERTICAL_DIRS = [
    [-1,0],
    [0,-1],
    [1,0],
    [0,1]
  ].freeze

  DIAGONAL_DIRS = [
    [-1,-1],
    [-1,1],
    [1,-1],
    [1,1]
  ].freeze

  def horizontal_and_vertical_dirs 
    HORIZONTAL_AND_VERTICAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    moves =[]

    row,col = pos
    move_dirs.each do |x,y|
        if (0..7).include?(row+x) && (0..7).include?(col+y)
            moves << [row+x,col+y] 
        end
    end
    moves
  end

#   def unblocked
end