require "ai.rb"

describe Ai do
  let(:board){double("board")}
  let(:ui){double("ui")}
  subject(:ai){Ai.new("X", board, "O", ui)}

  describe "#score" do

    context "Given board where ai is victorious" do
      before(:each) do
        allow(board).to receive(:victory_type).and_return("X")
      end

      it "returns value of 3 when depth == 7" do
        expect(ai.score(board, 7)).to eql(3)
      end

      it "returns value of 1 when depth == 9" do
        expect(ai.score(board, 9)).to eql(1)
      end
    end

    context "given board where ai has lost" do
      before(:each) do
        allow(board).to receive(:victory_type).and_return("O")
      end

      it "returns value of -2 when depth == 8" do
        expect(ai.score(board, 8)).to eql(-2)
      end
    end

    context "given board where ai has drawn" do
      before(:each) do
        allow(board).to receive(:victory_type).and_return(false)
      end

      it "returns value of 0" do
        expect(ai.score(board, 8)).to eql(0)
      end
    end


  end

end
