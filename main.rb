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
    dfs = graph.bfs
    puts "Here is the traversed graph using BFS:"
    dfs.each { |row| puts row.inspect }
end


main()
