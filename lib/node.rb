class Node
  attr_accessor :value, :left_node, :right_node

  def initialize(value)
    @value = value
    @left_node = nil
    @right_node = nil
  end

  def number_of_children
    if !@left_node.nil? && !@right_node.nil?
      2
    elsif !@left_node.nil? || !@right_node.nil?
      1
    else
      0
    end
  end

  def to_s
    str = "value: #{@value} "
    str += @left_node.nil? ? "left node: nil " : "left node: #{left_node.value} "
    str += @left_node.nil? ? "right node: nil" : "right node: #{right_node.value}"
    str
  end
end
