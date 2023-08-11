require '../lib/undirected_graph_new.rb'

RSpec.describe UndirectedGraph do
    let(:graph) { UndirectedGraph.new(matrix) }
    let(:matrix) do
        [
            [1, 1, 0],
            [0, 1, 1],
            [0, 1, 1]
        ]
    end

    describe "#initialize" do
        it "sets the instance vars" do
            expect(graph.matrix).to eq(matrix)
        end
    end

    describe "#dfs" do
        subject { graph.dfs }

        it "outputs array containing the traversed vertices" do
            expect(subject).to match_array([[0, 0], [0, 1], [1, 1], [1, 2], [2, 2], [2, 1]])
        end

        context "for an empty matrix" do
            let(:matrix) { [] }

            it "outputs empty array" do
                expect(subject).to eq([])
            end
        end
    end

    describe "#bfs" do
        subject { graph.bfs }

        it "outputs array containing the traversed vertices" do
            expect(subject).to match_array([[0, 0], [0, 1], [1, 1], [1, 2], [2, 1], [2, 2]])
        end

        context "for an empty matrix" do
            let(:matrix) { [] }

            it "outputs empty array" do
                expect(subject).to eq([])
            end
        end
    end

    describe "#shortest_path" do
        subject { graph.shortest_path(target_x, target_y) }

        let(:target_x) { 2 }
        let(:target_y) { 2 }

        it "outputs array containing the shortest path's vertices" do
            expect(subject).to match_array([[0, 0], [0, 1], [1, 1], [1, 2], [2, 2]])
        end

        context "for nonexistent path" do
            let(:target_x) { 0 }
            let(:target_y) { 2 }

            it "outputs empty array" do
                expect(subject).to eq([])
            end
        end
    end
end
