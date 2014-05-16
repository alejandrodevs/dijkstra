module Dijkstra
  class Graph
    def nodes
      @nodes ||= NodeCollection.new
    end

    def dijkstra src, des
      Algorithm.new(src, des, nodes).run!
    end
  end
end
