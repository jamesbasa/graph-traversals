require 'set'

class UndirectedGraph
    attr_accessor :matrix

    # down, up, right, left
    DIRECTIONS = [[0, 1], [0, -1], [1, 0], [-1, 0]]

    def initialize(matrix)
        @matrix = matrix
    end

    def dfs
        search(is_dfs: true)
    end

    def bfs
        search(is_dfs: false)
    end

    private

    def search(is_dfs: false)
        return [] if @matrix.empty?

        visited = Set.new

        @num_rows, @num_cols = @matrix.length, @matrix[0].length

        (0...@num_rows).each do |row|
            (0...@num_cols).each do |col|
                traverse(row, col, visited, is_dfs)
            end
        end

        return visited.to_a
    end

    def traverse(row, col, visited, is_dfs = false)
        return unless @matrix[row][col] == 1
        return if visited.include?([row, col])

        if is_dfs
            visited << [row, col]

            DIRECTIONS.each do |dir|
                new_row = row + dir[0]
                new_col = col + dir[1]

                # use implicit recursion stack
                traverse(new_row, new_col, visited, is_dfs) if in_bounds?(new_row, new_col)
            end
        else
            queue = Queue.new
            queue << [row, col]
            visited << [row, col]

            while !queue.empty?
                current_row, current_col = queue.pop

                visited << [current_row, current_col]

                DIRECTIONS.each do |dir|
                    new_row = current_row + dir[0]
                    new_col = current_col + dir[1]

                    if in_bounds?(new_row, new_col) && @matrix[new_row][new_col] == 1 && !visited.include?([new_row, new_col])
                        queue << [new_row, new_col]
                    end
                end
            end
        end
    end

    def in_bounds?(row, col)
        row.between?(0, @num_rows - 1) && col.between?(0, @num_cols - 1)
    end
end
