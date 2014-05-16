# Dijkstra's Algorithm

## What's this?
*Here goes a description*

## Getting Started
```
git clone git@github.com:alejandrogutierrez/dijkstra.git
cd dijkstra
```

## Usage
Go to the project path and open up your interactive ruby shell (irb)
```ruby
require './dijkstra'

graph = Dijkstra::Graph.new

graph.nodes.add('A')
graph.nodes.add('B')
graph.nodes.add('C')
graph.nodes.add('D')

graph.nodes.link('A', 'B', 10)
graph.nodes.link('B', 'C', 20)
graph.nodes.link('A', 'C', 25)
graph.nodes.link('A', 'D', 10)
graph.nodes.link('D', 'C', 10)

graph.dijkstra('A', 'C')
# Path: ['A', 'D', 'C']
# Dist: 20
```
