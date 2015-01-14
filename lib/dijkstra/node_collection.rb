module Dijkstra
  class NodeCollection < Array
    def add(name)
      push(Node.new(name))
    end

    def find(name)
      detect { |node| node.name == name }
    end

    def edge(a, b, length)
      find(a).neighbors.add(find(b), length)
      find(b).neighbors.add(find(a), length)
    end
  end
end
