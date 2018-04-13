require "ai.rb"
require "board.rb"
require "ui.rb"
describe Ai do
  subject(:board){Board.new}
  let(:ui){double("ui")}
  subject(:ai){Ai.new("X", board, "O", ui)}

  describe "#get_player_move" do
    before do
      allow(ui).to receive(:computer_message)
      allow(ui).to receive(:wait)
    end
    context "when given board where ai stops itself from losing by selecting position index 0" do
      it "returns 0" do
        board.game_board = ["X", "O", "3", "4", "O", "6", "7", "8", "9"]
        expect(ai.get_player_move).to eql(7)
      end
    end

    context "given board where ai will win if it goes in position index 2" do
      it "returns 2" do
        board.game_board = ["X", "X", "3", "O", "O", "6", "7", "8", "9"]
        expect(ai.get_player_move).to eql(2)
      end
    end

    context "(test for depth) given rigged board where ai will eventually lose" do
      it "it still delays defeat by selecting obvious position" do
        board.game_board = ["1", "2", "O", "O", "5", "6", "7", "8", "O"]
        expect(ai.get_player_move).to eql(5)
      end
    end

    context "when given a board with only two spaces left" do
      it "picks the correct spot for ai to not lose" do
        board.game_board = ["X", "O", "X", "O", "O", "6", "O", "X", "9"]
        expect(ai.get_player_move).to eql(5)
      end
    end


  end
end
