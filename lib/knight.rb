class Knight
  MOVES_OFFSETS = [1, -1].product([2, -2]) + [2, -2].product([1, -1])
  def initialize
    @graph = initialize_graph
  end

  def initialize_graph
    graph = Array.new(8) { [] }.map! { Array.new(8) { [] } }
    8.times do |x|
      8.times do |y|
        MOVES_OFFSETS.each do |offset|
          final_position = [x + offset[0], y + offset[1]]
          graph[x][y] << final_position if final_position.all? { |element| element.between?(0, 7) }
        end
      end
    end
    graph
  end

  def print_graph
    @graph
  end
end

graph = Graph.new

p graph.print_graph[2][3]
