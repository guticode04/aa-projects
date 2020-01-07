# Anagrams 
# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true

#Phase 1
# Time complexity : O(n!)
# Space complexity: O(n!)
def first_anagram(string, anagram)
    anagrams = string.split("").permutation.to_a 
    anagrams.include?(anagram.split(""))
end 

p first_anagram("cat", "tac")
p first_anagram("dog", "cat")

#Phase 2 

#time complexity O(n^2)
#space complexity O(n)
def second_anagram?(string, anagram)
    gram = anagram.split("")
    string.each_char do |char|
        idx = gram.index(char)
        gram.delete_at(idx) unless idx == nil
    end 
    gram.empty?
end 

p second_anagram?("cat", "tac")
p second_anagram?("dog", "cat")

#Phase 3
#time complexity O(n^2)
#space complexity O(nlog(n))
def third_anagram?(string,anagram)

  sorted_str = string.split("").sort
  sorted_gram = anagram.split("").sort

  sorted_str == sorted_gram

end


p third_anagram?("cat", "tac")
p third_anagram?("dog", "cat")

#phase 4
#time complexity O(n)
#space complexity O(n)

def fourth_anagram?(string,anagram)
  hash = Hash.new(0)
  string.each_char do |char|
    hash[char] += 1
  end
  anagram.each_char do |char|
    hash[char] -= 1
  end
  hash.all? { |k,v| v == 0 }
end

p fourth_anagram?("cat", "tac")
p fourth_anagram?("dog", "cat")