require 'minitest/autorun'
require './dijkstra'

class TestDijkstra < MiniTest::Unit::TestCase
  def setup
    @graph = Dijkstra::Graph.new
    @graph.nodes.add('A')
    @graph.nodes.add('B')
    @graph.nodes.add('C')
    @graph.nodes.add('D')
    @graph.nodes.add('E')

    @graph.nodes.link('A', 'B', 10)
    @graph.nodes.link('A', 'C', 25)
    @graph.nodes.link('A', 'D', 10)
    @graph.nodes.link('B', 'C', 20)
    @graph.nodes.link('D', 'C', 10)
  end

  def test_total_nodes
    assert_equal 5, @graph.nodes.size
  end

  def test_neighbors
    assert @graph.nodes.find('A').neighbors.find('B')
    assert @graph.nodes.find('A').neighbors.find('C')
    assert @graph.nodes.find('A').neighbors.find('D')
    assert @graph.nodes.find('B').neighbors.find('A')
    assert @graph.nodes.find('B').neighbors.find('C')
    assert @graph.nodes.find('C').neighbors.find('A')
    assert @graph.nodes.find('C').neighbors.find('B')
    assert @graph.nodes.find('C').neighbors.find('D')
    assert @graph.nodes.find('D').neighbors.find('A')
    assert @graph.nodes.find('D').neighbors.find('C')
  end

  def test_neighbor_distances
    assert_equal 10, @graph.nodes.find('A').neighbors.distance('B')
    assert_equal 25, @graph.nodes.find('A').neighbors.distance('C')
    assert_equal 10, @graph.nodes.find('A').neighbors.distance('D')
    assert_equal 10, @graph.nodes.find('B').neighbors.distance('A')
    assert_equal 20, @graph.nodes.find('B').neighbors.distance('C')
    assert_equal 25, @graph.nodes.find('C').neighbors.distance('A')
    assert_equal 20, @graph.nodes.find('C').neighbors.distance('B')
    assert_equal 10, @graph.nodes.find('C').neighbors.distance('D')
    assert_equal 10, @graph.nodes.find('D').neighbors.distance('A')
    assert_equal 10, @graph.nodes.find('D').neighbors.distance('C')

  end

  def test_dijkstra
    assert_equal ({ path: ['A', 'D', 'C'], distance: 20 }), @graph.dijkstra('A', 'C')
    assert_equal ({ path: ['B', 'A', 'D'], distance: 20 }), @graph.dijkstra('B', 'D')
    assert_equal ({ path: [], distance: Float::INFINITY }), @graph.dijkstra('A', 'E')
  end
end
