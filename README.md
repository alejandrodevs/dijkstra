# Dijkstra's Algorithm


## Getting Started
```
$ git clone git@github.com:alejandrogutierrez/dijkstra.git
$ cd dijkstra
```


## Usage
```ruby
# irb (shell)
require './dijkstra'

graph = Dijkstra::Graph.new

# Graph nodes.
graph.nodes.add('A')
graph.nodes.add('B')
graph.nodes.add('C')
graph.nodes.add('D')
graph.nodes.add('E')

# Graph edges and weights.
graph.nodes.edge('A', 'B', 10)
graph.nodes.edge('A', 'C', 25)
graph.nodes.edge('A', 'D', 10)
graph.nodes.edge('B', 'C', 20)
graph.nodes.edge('D', 'C', 10)

# Examples.
graph.dijkstra('A', 'C')  # => { path: ['A', 'D', 'C'], distance: 20 }
graph.dijkstra('B', 'D')  # => { path: ['B', 'A', 'D'], distance: 20 }
graph.dijkstra('A', 'E')  # => { path: [], distance: Float::INFINITY }
```


## Testing
```
ruby -Ilib:test test/dijkstra_test.rb
```
