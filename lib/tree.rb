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
      if value < current_node.value
        current_node = current_node.left_node
      elsif value > current_node.value
        current_node = current_node.right_node
      else
        return nil
      end
    end
    if value < prev_node.value
      prev_node.left_node = Node.new(value)
    else
      prev_node.right_node = Node.new(value)
    end
  end

  def insert_recursion(value, root = @root)
    if value < root.value
      if root.left_node.nil?
        root.left_node = Node.new(value)
        return
      end
      insert_recursion(value, root.left_node)
    elsif value > root.value
      if root.right_node.nil?
        root.right_node = Node.new(value)
        return
      end
      insert_recursion(value, root.right_node)
    end
  end

  def delete(value, root = @root)
    if value < root.value
      if value == root.left_node.value
        case root.left_node.number_of_children
        when 2
          nil
        when 1
          root.left_node = if root.left_node.right_node.nil?
                             root.left_node.left_node
                           else
                             root.left_node.right_node
                           end
        when 0
          root.left_node = nil
        end
        return
      end
      delete(value, root.left_node)
    elsif value > root.value
      if value == root.right_node.value
        case root.right_node.number_of_children
        when 2
          nil
        when 1
          root.right_node = if root.right_node.right_node.nil?
                              root.right_node.left_node
                            else
                              root.right_node.right_node
                            end
        when 0
          root.right_node = nil
        end
        return
      end
      delete(value, root.right_node)
    end
  end

  def find_candidate_node(root)
    if root.left_node.nil?
      delete(root)
      root
    end
    find_candidate_node(root.left_node)
  end
end
