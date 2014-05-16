module Dijkstra
  class NeighborCollection < Hash
    def add node, length
      merge!(node => length)
    end

    def find name
      keys.detect { |node| node.name == name }
    end

    def distance name
      self[find(name)]
    end
  end
end
