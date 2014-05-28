module Dijkstra
  class TableHash < Hash
    def initialize nodes
      nodes.each do |node|
        merge!(node => {
          distance: Float::INFINITY,
          visited: false,
          path: []
        })
      end
    end

    def visited
      select { |node, data| data[:visited] }
    end

    def unvisited
      select { |node, data| !data[:visited] }
    end

    def nearest_node
      unvisited.min_by { |node, data| data[:distance] }[0]
    end
  end
end
