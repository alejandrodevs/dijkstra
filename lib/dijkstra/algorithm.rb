module Dijkstra
  class Algorithm
    attr_reader :src, :des, :table

    def initialize src, des, nodes
      @src   = nodes.find(src)
      @des   = nodes.find(des)
      @table = TableHash.new(nodes)
    end

    def run!
      # Initialize distance of initial node with 0.
      table[src][:distance] = 0
      table[src][:path] << src.name

      while table.unvisited.any?
        # Gets nearest node and its unvisited neighbors.
        current   = table.nearest_node
        neighbors = current.neighbors.keys - table.visited.keys

        neighbors.each do |neighbor|
          old_distance = table[neighbor][:distance]
          new_distance = table[current][:distance] + current.neighbors.distance(neighbor.name)

          if new_distance < old_distance
            table[neighbor][:path]     = [table[current][:path], neighbor.name].flatten
            table[neighbor][:distance] = new_distance
          end
        end

        # Sets current node like visited.
        table[current][:visited] = true
      end

      # Returns shortest path and its distance.
      {
        path: table[des][:path],
        distance: table[des][:distance]
      }
    end
  end
end
