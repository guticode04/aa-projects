require "byebug"
class PolyTreeNode

  attr_accessor :value
  attr_reader :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def children
    @children.dup
  end

  def parent=(parent)
    return if self.parent == parent

    if self.parent
      self.parent._children.delete(self)
    end

    @parent = parent
    self.parent._children << self unless self.parent.nil?

    self

  end

  def remove_child(child)
    # take child off of its parent's children's list
    # parent node is self
    raise "#{child} is not a child" unless child.parent == self
    _children.delete(child)
    child.parent = nil
  end

  def add_child(child)
    child.parent = self
  end

  def dfs_iter(target_value)
    stack = []
    stack.push(self)
    until stack.empty?
      node = stack.pop
      return node if node.value == target_value
      node._children.each { |child| stack.push(child) }
    end
    nil
    
  end

  def bfs(target_value)
    # Queue is a FIFO data type
    queue = []
    queue.push(self)
    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      node._children.each { |child| queue.push(child) }
    end
    nil
  end

  def dfs(target_value)
    return self if self.value == target_value

    found = nil

    self._children.each { |child|
      found = child.dfs(target_value) if found.nil?
    }

    found
  end

  protected
  
  def _children
    @children
  end

end