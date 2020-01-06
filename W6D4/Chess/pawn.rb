require './piece.rb'

class Pawn < Piece

  attr_reader :symbol

  def symbol
    '♙'.colorize(color)
  end

  def moves
    forward_steps + side_attacks
  end

  private

  def forward_steps
    row,col = pos
    next_step = [row + color_dir, col]
    return [] unless board.empty?(next_step) && board.valid_pos?(next_step)
    steps = [next_step]
    two_step = [row + (color_dir * 2), col]
    steps << two_step if start_row? && board.empty?(two_step)
    steps
  end

  def start_row?
    pos[0] == (color == :white) ? 6 : 1
  end

  def side_attacks
    row, col = pos
    side_steps = [[row + color_dir, col - 1],[row + color_dir, col + 1]]
    side_steps.select do |pos|
      next false unless board.valid_pos?(pos)
      next false if board.empty?(pos)
      threaten_piece = board[pos]
      threaten_piece && threaten_piece.color != color
    end
  end

  def color_dir
    color == white ? -1 : 1
  end
end