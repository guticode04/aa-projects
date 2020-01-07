def two_sum?(arr, target_sum)
    # your code here...
end

arr = [0, 1, 5, 7]
two_sum?(arr, 6) # => should be true
two_sum?(arr, 10) # => should be false

#time complexity O(n^2)
#space complexity O(n)

def bad_two_sum?(arr, target_sum)
    arr.each_with_index do |ele1, idx1|
        arr.each_with_index do |ele2, idx2|
            return true if ele1 + ele2 == target_sum && idx1 != idx2
        end
    end 
    false
end 

p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

#time complexity O(nlog(n))
#space complexity O(n)
def okay_two_sum?(arr, target_sum) #[2,4,10] 6
    sorted_arr = arr.sort 
    (0...sorted_arr.length - 1).each do |idx|
        return true if (sorted_arr[idx] + sorted_arr[idx + 1]) == target_sum
        # return false if sorted_arr[idx] > target_sum
    end 
    false
end 

p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false

#time complexity O(n)
#space complexity O(n)
def hash_two_sum?(arr, target_sum)

  hash = Hash.new(0)
  #keys => indices
  #value => value
  arr.each_with_index do |ele, idx|
    hash[idx] = ele
  end

  (0...hash.length - 1).each do |idx|
    return true if hash[idx] + hash[idx + 1] == target_sum
  end

  false
end

p hash_two_sum?(arr, 6) # => should be true
p hash_two_sum?(arr, 10)