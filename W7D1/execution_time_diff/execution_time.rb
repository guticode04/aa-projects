#my_min phase 1 
#time O(n^2)
#space complexity O(1) 
def my_min(list)
    smallest = list[0]
    list.each do |ele1|
        list.each do |ele2|
            smallest = ele2 if smallest > ele2
        end 
    end 
    smallest
end 

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p "my_min phase 1"
# p my_min(list)

# my_min phase 2
#Time complexity : O(n)
#Space complexity : O(1)
def my_min2(list)
    smallest = list[0]
    list.each do |ele|
        smallest = ele if smallest > ele
    end 
    smallest
end 

# p "my_min phase 2"
# p my_min2(list)

#largest contiguous sub-sum phase 1
#O(n^2) => nested
#O(n) => other loop
#O(n^3) time complexity
#O(n^2/2) => O(n^2) space complexity
def largest_contiguous_subsum(list)
    subs = []

    list.each_with_index do |ele,idx1|
      list.each_with_index do |ele,idx2|
        subs << list[idx1..idx2]
      end
    end

    max = subs[0].sum
    subs.each do |sub|
      current_sum = sub.sum
      max = current_sum if max < current_sum
    end

    max
end 

list2 = [5, 3, -7]
p largest_contiguous_subsum(list2) # => 8

    # # possible sub-sums
    # [5]           # => 5
    # [5, 3]        # => 8 --> we want this one
    # [5, 3, -7]    # => 1
    # [3]           # => 3
    # [3, -7]       # => -4
    # [-7]          # => -7


#O(n) time complexity
#O(1) space complexity
def largest_contiguous_subsum2(list) #[5, 3, -7]
  largest_sum = list.first #5 #8
  current_sum = list.first #5
    
    (1...list.length).each do |idx|
        current_sum = 0 if current_sum < 0
        current_sum += list[idx] #8 - 7=> -1
        largest_sum = current_sum if current_sum > largest_sum
    end

    largest_sum #8 

end

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list)