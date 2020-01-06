
class Array

    def my_uniq
        # self is the given array
        # return a new array with no duplcates
        new_arr = []
        self.each do |el|
            unless new_arr.include?(el)
                new_arr << el
            end
        end
        new_arr
    end

    def two_sum
        pairs = self.combination(2).to_a
        result = pairs.select { |pair| pair.sum == 0 }
        result.map do |pair|
          [self.index(pair[0]), self.index(pair[1])]
        end
    end

    def my_transpose
        new_arr = Array.new(self.length) { Array.new(self.length) }
        
        self.each_with_index do |row, row_idx|
          row.each_with_index do |col, col_idx|
            new_arr[col_idx][row_idx] = self[row_idx][col_idx]
          end
        end

        new_arr
    end

end


def stock_picker(prices)
    best_days = []
    buy = prices.min
    sell = prices.max
    best_days << prices.index(buy)
    best_days << prices.index(sell)

    best_days
end