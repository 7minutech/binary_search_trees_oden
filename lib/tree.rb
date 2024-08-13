require_relative "node"
class Tree
  attr_accessor :arr, :root

  def initialize(arr)
    @arr = arr
    @root = build_tree
  end

  def build_tree(array = @arr, start = 0, last = @arr.length - 1)
    return nil if start > last

    mid = (start + last) / 2
    root = Node.new(array[mid])
    root.left_node = (build_tree(array, start, mid - 1))
    root.right_node = (build_tree(array, mid + 1, last))
    root
  end
end
