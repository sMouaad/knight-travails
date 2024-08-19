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

  def moves(initial_position, final_position)
    queue = [[initial_position]]
    visited = Set.new([initial_position])
    until queue.empty?
      path = queue.shift
      position = path.last

      break if position == final_position

      @graph[position[0]][position[1]].each do |next_pos|
        unless visited.include?(next_pos)
          visited.add(next_pos)
          queue.push(path + [next_pos])
        end
      end
    end
    puts "Knight moved in #{path.size} turns, the path :"
    path.each { |element| p element }
  end
end
