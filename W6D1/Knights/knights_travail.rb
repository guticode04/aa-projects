require_relative "00_tree_node.rb"

class KnightPathFinder
  attr_reader :root_position

  class << self
    def valid_moves(position)
      # position = [0,0]
      positions = []

      # first, last = position => first = 0 and last = 0
      first = position[0]
      last = position[1]

      positions << [first+2,last+1] unless 
      positions << [first+2,last-1]
      positions << [first-2,last+1]
      positions << [first-2,last-1]
      positions << [first+1,last+2]
      positions << [first+1,last-2]
      positions << [first-1,last+2]
      positions << [first-1,last-2]

      # valid_moves => [[2,1], [1,2]]
      # [-1,+2],[-1,-2],[-2,+1],[-2,-1],[+1,+2],[+1,-2]
      # [+2,+1], [+2,-1]
      # position = 2,2
      # valid moves = 1,4 1,0 0,3 0,1 3,4 3,0 4,3 4,1
      positions
    end
  end

  def initialize(position) #position = [0,0]
    @root_position = PolyTreeNode.new(position)
    build_move_tree(@root_position)
  end

  def build_move_tree(position)
    # position = PolyTreeNode(0,0)
    # ...
    self.class.valid_moves(position.value)
  end
end

