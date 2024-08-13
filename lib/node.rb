class Node
  attr_accessor :value, :left_node, :right_node

  def initialize(value)
    @value = value
    @left_node = nil
    @right_node = nil
  end

  def number_of_children
    if @left_node && @right_node != nil
      2
    elsif @left_node != nil || @right_node != nil
      1
    else
      0
  end
end
