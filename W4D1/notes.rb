require 'set'
class GraphNode
  attr_accessor :val, :neighbors

  def initialize(val)
    self.val = val
    self.neighbors = []
  end

end

def bfs(starting_node, target_value)
  queue = [starting_node]
  visited = Set.new()

  while !queue.empty? #same as until queue.empty?
      node = queue.shift
      if !visited.include?(node) #same as unless visited.include?(node)
          return node.val if node.val == target_value
          visited.add(node)
          queue += node.neighbors
      end
    end
    return nil 
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")



