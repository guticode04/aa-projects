
class TowersOfHanoi

    attr_accessor :board

    def initialize
        @board = [[1, 2, 3, 4], [], []]
    end

    def move(start_pile, end_pile) # start_pile and end_pile are indices
        # to move from the top of the pile, we can use .shift
        disk = @board[start_pile].shift
        if @board[end_pile].empty?
            @board[end_pile].unshift(disk)
        else 
        #[[3, 4], [], [1, 2]]
            @board[end_pile].unshift(disk) if @board[end_pile].all? { |el| el > disk }
        end
    end

    def won?
      @board[1].length == 4 || @board[2].length == 4 
    end

    def play
        until won?
            p @board
            puts "What tower do you want to move from?"
            from_tower = gets.chomp.to_i
            puts "What tower do you want to move to?"
            to_tower = gets.chomp.to_i
            move(from_tower, to_tower)
        end
    end
end

game = TowersOfHanoi.new
game.play