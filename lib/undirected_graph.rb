class UndirectedGraph
    attr_accessor :matrix

    # down, up, right, left
    DIRECTIONS = [[0, 1], [0, -1], [1, 0], [-1, 0]]

    def initialize(matrix)
        @matrix = matrix
    end

    def dfs
        return [] if @matrix.empty?

        visited = Set.new

        @num_rows, @num_cols = @matrix.length, @matrix[0].length

        (0...@num_rows).each do |row|
            (0...@num_cols).each do |col|
                traverse(row, col, visited)
            end
        end

        return visited.to_a
    end

    def bfs
        # TODO
    end

    private

    def traverse(row, col, visited)
        return unless @matrix[row][col] == 1
        return if visited.include?([row, col])

        visited << [row, col]

        DIRECTIONS.each do |dir|
            new_row = row + dir[0]
            new_col = col + dir[1]

            traverse(new_row, new_col, visited) if in_bounds?(new_row, new_col)
        end
    end

    def in_bounds?(row, col)
        row.between?(0, @num_rows - 1) && col.between?(0, @num_cols - 1)
    end
end
