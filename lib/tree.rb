require_relative "node"
# defines a balanced binary tree class
class Tree
  attr_accessor :arr, :root

  def initialize(arr)
    @arr = arr.sort.uniq
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

  def pretty_print(node = @root, prefix = "", is_left = true)
    pretty_print(node.right_node, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_node
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left_node, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_node
  end

  def insert(value)
    current_node = @root
    while current_node
      prev_node = current_node
      if value == current_node.value
        return nil
      elsif value < current_node.value
        current_node = current_node.left_node
      else
        current_node = current_node.right_node
      end
    end
    if value < prev_node.value
      prev_node.left_node = Node.new(value)
    else
      prev_node.right_node = Node.new(value)
    end
  end
end
