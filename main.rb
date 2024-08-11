require_relative "lib/node"
require_relative "lib/tree"
arr = [1, 2, 3, 4, 5, 6, 7]
my_tree = Tree.new(arr)
my_tree.build_tree
puts my_tree.tree_arr
