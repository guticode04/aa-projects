class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
      self.each_with_index.inject(0) do |intermediate_hash, (el, i)|
        (el.hash + i.hash) ^ intermediate_hash
      end
  end
end

class String
  def hash
    # new_arr = []
    # self.chars.each do |char|
    #   new_arr << char.ord.hash
    # end
    self.chars.map(&:ord).hash
    # new_arr
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.hash
    # 0
  end
end
