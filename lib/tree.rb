class Tree
  attr_accessor :arr, :root

  def initialize(arr)
    @arr = arr
    @tree_arr = nil
    @root = arr[arr.length / 2]
  end

  def build_tree
    @root
  end
end
