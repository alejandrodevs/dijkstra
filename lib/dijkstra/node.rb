module Dijkstra
  class Node
    attr_reader :name

    def initialize name
      @name = name
    end

    def neighbors
      @neighbors ||= NeighborCollection.new
    end
  end
end
