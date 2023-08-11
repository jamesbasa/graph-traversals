require 'set'

class UndirectedGraph
    DIRECTIONS = [[0, 1], [0, -1], [1, 0], [-1, 0]]

    attr_accessor :matrix

    def initialize(matrix)
        @matrix = matrix
    end

    def dfs
        search(is_dfs: true)
    end

    def bfs
        search(is_dfs: false)
    end

    def shortest_path(target_x, target_y)
        queue_of_paths = [[[0, 0]]]  # Each element in the queue is a path
        visited = Set.new

        return [] if matrix.empty?

        while !queue_of_paths.empty?
            # BFS uses a queue
            current_path = queue_of_paths.shift
            current_coordinate = current_path.last
            return current_path if current_coordinate[0] == target_x && current_coordinate[1] == target_y

            next unless matrix[current_coordinate[0]][current_coordinate[1]] == 1
            next if visited.include?(current_coordinate)

            visited << current_coordinate

            DIRECTIONS.each do |dir|
                next_coordinate = [current_coordinate[0] + dir[0], current_coordinate[1] + dir[1]]

                next if out_of_bounds?(next_coordinate)
                next unless matrix[next_coordinate[0]][next_coordinate[1]] == 1
                next if visited.include?(next_coordinate)

                queue_of_paths << (current_path.dup << next_coordinate)
            end
        end

        return []
    end

    private

    def search(is_dfs: false)
        coordinates_list = [[0, 0]]
        visited = Set.new

        return [] if matrix.empty?

        while !coordinates_list.empty?
            # DFS uses a stack; BFS uses a queue
            current_coordinate =
                if is_dfs
                    coordinates_list.pop
                else
                    coordinates_list.shift
                end
            
            next unless matrix[current_coordinate[0]][current_coordinate[1]] == 1
            next if visited.include?(current_coordinate)
            
            visited << current_coordinate

            DIRECTIONS.each do |dir|
                next_coordinate = [current_coordinate[0] + dir[0], current_coordinate[1] + dir[1]]

                next if out_of_bounds?(next_coordinate)
                next unless matrix[next_coordinate[0]][next_coordinate[1]] == 1
                next if visited.include?(next_coordinate)

                coordinates_list << next_coordinate 
            end
        end

        return visited.to_a
    end

    def out_of_bounds?(coordinate)
        coordinate_x = coordinate[0]
        coordinate_y = coordinate[1]
        
        coordinate_x < 0 || coordinate_x >= matrix.length || coordinate_y < 0 || coordinate_y >= matrix[0].length
    end
end
