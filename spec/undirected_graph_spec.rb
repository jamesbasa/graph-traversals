require '../lib/undirected_graph.rb'

RSpec.describe UndirectedGraph do
    let(:graph) { UndirectedGraph.new(matrix) }
    let(:matrix) do
        [
            [1, 1, 0],
            [0, 1, 0],
            [1, 0, 1]
        ]
    end

    describe "#initialize" do
        it "sets the instance vars" do
            expect(graph.matrix).to eq(matrix)
        end
    end

    describe "#dfs" do
        it "outputs array containing the traversed vertices" do
            expect(graph.dfs).to eq([[0, 0], [0, 1], [1, 1], [2, 0], [2, 2]])
        end

        context "for an empty matrix" do
            let(:matrix) { [] }

            it "outputs empty array" do
                expect(graph.dfs).to eq([])
            end
        end
    end
end
