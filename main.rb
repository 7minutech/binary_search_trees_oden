require_relative "lib/node"
require_relative "lib/tree"
my_arr = (Array.new(15) { rand(1..100) })
my_tree = Tree.new(my_arr)
puts my_tree.pretty_print
my_tree.level_order.each { |node| print "#{node.value} " }
puts " "
my_tree.in_order.each { |node| print "#{node.value} " }
puts " "
my_tree.pre_order.each { |node| print "#{node.value} " }
puts " "
my_tree.post_order.each { |node| print "#{node.value} " }
puts " "
puts " "
nums_to_unbalance = (Array.new(5) { rand(100..200) })
nums_to_unbalance.each { |num| my_tree.insert(num) }
my_tree.pretty_print
puts my_tree.balanced?
my_tree.rebalance
my_tree.pretty_print
my_tree.level_order.each { |node| print "#{node.value} " }
puts " "
my_tree.in_order.each { |node| print "#{node.value} " }
puts " "
my_tree.pre_order.each { |node| print "#{node.value} " }
puts " "
my_tree.post_order.each { |node| print "#{node.value} " }
