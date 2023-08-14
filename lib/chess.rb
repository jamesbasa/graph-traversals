=begin
Return the path with the minimum number of moves for a horse to reach the given target coordinate.
The plane has no boundaries and is infinitely expanding in both X and Y directions
=end

def horse_shortest_path_from_origin(target_x, target_y)
    directions = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
    
    # use BFS
    queue_of_paths = Queue.new # each elem looks like [[x, y]]
    queue_of_paths << [[0, 0]]

    while !queue_of_paths.empty?
        current_path = queue_of_paths.pop
        current_coordinate = current_path.last
        return current_path if current_coordinate[0] == target_x && current_coordinate[1] == target_y

        directions.each do |dir|
            next_coordinate_x = current_coordinate[0] + dir[0]
            next_coordinate_y = current_coordinate[1] + dir[1]
            next_coordinate = [next_coordinate_x, next_coordinate_y]

            queue_of_paths << (current_path.dup << next_coordinate)
        end
    end
end

def print_board(coordinates_list)
    puts "It took #{coordinates_list.length - 1} moves:"
    x_coordinates = coordinates_list.map { |coord| coord[0] }
    y_coordinates = coordinates_list.map { |coord| coord[1] }

    min_x = x_coordinates.min
    max_x = x_coordinates.max
    min_y = y_coordinates.min
    max_y = y_coordinates.max

    (min_y..max_y).reverse_each do |y|
        (min_x..max_x).each do |x|
            # print board top-down, left to right
            if index = coordinates_list.index([x, y])
                print "#{index} "
            else
                print "X "
            end
        end
        puts
    end
end


# TESTS
print_board(horse_shortest_path_from_origin(1, -4))
puts
print_board(horse_shortest_path_from_origin(6, -5))
puts
