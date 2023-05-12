require '../lib/undirected_graph.rb'

RSpec.describe UndirectedGraph do
    describe "#initialize" do
        let(:graph) { UndirectedGraph.new(matrix) }
        let(:matrix) { [[1, 2], [3, 4]] }

        it "sets the instance vars" do
            expect(graph.matrix).to eq(matrix)
        end
    end
end
