require_relative "node"
class Tree
  attr_accessor :arr

  def initialize(arr)
    @arr = arr
    @tree_arr = nil
    @root = nil
  end

  def build_tree
  end
end
