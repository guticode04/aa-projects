require "./piece.rb"
require "./sliding_piece.rb"
require "./stepping_piece.rb"
require "./pawn.rb"
require "./null_piece.rb"

class Board
  attr_reader :grid
  def self.fill_board

    grid = Array.new(8) { Array.new(8,) }
    #row 0 black => rook, knight, bishop, Queen, King, bishop, knight, rook
    #row 1 black => all pawns
    #row 2 - 5 => Null pieces
    #row 6 white => all pawns
    #row 7 white => rook, knight, bishop, Queen, King, bishop, knight, rook

    # array of symbols
    (0...grid.length).each do |row_no| # [[],[],[]]
        if row_no == 0 || row_no == 7
            Board.fill_end_rows(grid, row_no)
        elsif row_no == 1 || row_no == 6
            Board.fill_pawn_rows(grid, row_no)
        else
            Board.fill_null_rows(grid,row_no)
        end
    end
    grid
  end

  def self.fill_pawn_rows(grid, row_no)
      color = :Black if row_no == 1 
      color = :White if row_no == 6
      
      (0...grid.length).each do |idx|
        grid[row_no,idx] = Pawn.new(:Pawn, color, self, [row_no,idx])
      end
      grid
  end

  def self.fill_null_rows(grid,row_no)
    (0...grid.length).each do |idx|
        grid[row_no,idx] = NullPiece.new(:Null, nil, self, [row_no,idx])
    end
    grid
  end
  # Fill the end rows with the right pieces from big_pieces
  # array and the right color according to the row no
  def self.fill_end_rows(grid, row_no)

    big_pieces = [:Rook, :Knight, :Bishop, :Queen, :King, :Bishop, :Knight, :Rook]
    color = :Black if row_no == 0 
    color = :White if row_no == 7

    big_pieces.each_with_index do |piece_symbol,idx|
        if [:Rook,:Bishop,:Queen].include?(piece_symbol) 
            grid[row_no,idx] =  SlidingPiece.new( piece_symbol,color, self, [row_no,idx] )
        elsif [:Knight, :King].include?(piece_symbol) 
            grid[row_no,idx] =  SteppingPiece.new( piece_symbol,color, self, [row_no,idx] )
        end
    end
    grid
  end

  def initialize
    # Create a class method to fill the board 
    # with right pieces at right positions
    # Always white on top of the board
    # Black at the bottom
    @grid = Board.fill_board
    # @sentinel = NullPiece.new(nil, nil, self, )
  end

  def [](pos)
    row,col = pos
    @grid[row,col]
  end

  def []=(pos,value)
    row,col = pos
    @grid[row,col] = value
  end

  # Check if the start_pos is empty - throw error
  # Check if end_pos is valid_move for th piece at start_pos
  def move_piece(color, start_pos, end_pos)
    if self.grid[start_pos] == self.sentinel 
        # The pos is empty - raise an error
        raise "There is no peice at the given start Position"   
    else
        current_piece = self.grid[start_pos]
        if current_piece.valid_moves.include?(end_pos)
          self.grid[end_pos] = current_piece
          self.grid[start_pos] = self.sentinel
        else
            raise " Not a valid move! "
        end
    end
  end

#   def print
#     (0...self.grid.length).each do |row|
#       (0...self.grid.length).each do |col|
#         puts self.grid[row,col] #.symbol 
#         # puts piece.symbol
#       end
#     end
#   end

end