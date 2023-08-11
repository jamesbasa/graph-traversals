require './lib/undirected_graph.rb'

def main
    matrix = [
        [1, 1, 0, 0],
        [0, 1, 1, 1],
        [1, 1, 0, 1],
        [0, 0, 1, 1]
    ]

    puts "Here is the input matrix:"
    matrix.each { |row| puts row.inspect }
    puts

    # DFS
    graph = UndirectedGraph.new(matrix)
    dfs = graph.dfs
    puts "Here is the traversed graph using DFS:"
    dfs.each { |row| puts row.inspect }

    # BFS
    graph = UndirectedGraph.new(matrix)
    bfs = graph.bfs
    puts "Here is the traversed graph using BFS:"
    bfs.each { |row| puts row.inspect }

    puts

    target_x = 1
    target_y = 3
    shortest_path = graph.shortest_path(target_x, target_y)
    puts "Here is the shortest path for (#{target_x}, #{target_y}):"
    shortest_path.each { |row| puts row.inspect }

    target_x = 2
    target_y = 0
    shortest_path = graph.shortest_path(target_x, target_y)
    puts "Here is the shortest path for (#{target_x}, #{target_y}):"
    shortest_path.each { |row| puts row.inspect }
end


main()
