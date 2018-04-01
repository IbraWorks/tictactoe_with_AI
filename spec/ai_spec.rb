require "ai.rb"
require "board.rb"
describe Ai do
  subject(:board){Board.new}
  subject(:ai){Ai.new("X", board, "O", "nil")}

  describe "#score" do

    context "given game at the start" do
      it "returns 0" do
        board.game_board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
        expect(ai.score(board, 0)).to eql(0)
      end
    end
    context "given state where nobody has won" do
      it "returns 0" do
        board.game_board = ["X","2","O","4","O","6","7","8","9"]
        expect(ai.score(board, 3)).to eql(0)
      end
    end

    context "Given state where ai type has won" do
      it "returns 10" do
        board.game_board = ["X","2","O","X","O","6","X","8","9"]
        expect(ai.score(board, 5)).to eql(5)
      end
    end

    context "Given state where ai type has failed" do
      it "returns -10" do
        board.game_board = ["O","2","X","O","X","6","O","8","9"]
        expect(ai.score(board, 5)).to eql(-5)
      end
    end

    context "Given state where ai has won " do
      it "returns 10" do
        board.game_board = ["O","O","X","O","X","X","X","O","X"]
        expect(ai.score(board, 9)).to eql(1)
      end
    end

    context "Given state where ai has lost " do
      it "returns -10" do
        board.game_board = ["O","X","X","X","O","X","O","X","O"]
        expect(ai.score(board, 9)).to eql(-1)
      end
    end


  end


end
