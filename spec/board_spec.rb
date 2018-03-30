require "board.rb"

describe Board do
  subject(:board){Board.new}

  describe "#victory?" do
    context "Given horizontal win condition for 'X' along the top" do
      it "returns true" do
        board.game_board = ["X","X","X","X","O","X","O","X","O"]
        expect(board.victory?).to be(true)
      end
    end

    context "Given horizontal win condition for 'O' along top" do
      it "returns true" do
        board.game_board = ["O","O","O","O","X","O","X","O","X"]
        expect(board.victory?).to be(true)
      end
    end

    context "Given vertical win condition for 'O' along left side" do
      it "returns true" do
        board.game_board = ["O","X","X","O","X","O","O","O","X"]
        expect(board.victory?).to be(true)
      end
    end

    context "Given vertical win condition for 'X' along right side" do
      it "returns true" do
        board.game_board = ["O","O","X","O","X","X","X","O","X"]
        expect(board.victory?).to be(true)
      end
    end

    context "Given vertical win condition for 'X' along middle" do
      it "returns true" do
        board.game_board = ["O","X","O","X","X","O","O","X","X"]
        expect(board.victory?).to be(true)
      end
    end

    context "Given diagonal win condition for 'X' from right side" do
      it "returns true" do
        board.game_board = ["O","X","X","O","X","O","X","O","O"]
        expect(board.victory?).to be(true)
      end
    end

    context "Given diagonal win condition for 'O' from left side" do
      it "returns true" do
        board.game_board = ["O","X","X","X","O","X","O","X","O"]
        expect(board.victory?).to be(true)
      end
    end

    context "Given tie" do
      it "should return false" do
        board.game_board = ["X","X","O","O","X","X","X","O","O"]
        expect(board.victory?).to be(false)
      end
    end

    context "Given no win condition has been met" do
      it "returns false " do
        board.game_board = ["0", "1", "2", "3", "X", "5", "6", "7", "O"]
        expect(board.victory?).to be(false)
      end
    end

    context "Given start of the game" do
      it "returns false " do
        board.game_board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
        expect(board.victory?).to be(false)
      end
    end

    context "Given after one turn" do
      it "returns false" do
        board.game_board = ["0", "1", "2", "3", "0", "5", "6", "7", "8"]
        expect(board.victory?).to be(false)
      end
    end
  end

  describe "#tie" do
    context "Given a tied board" do
      it "returns true" do
        board.game_board  =["X","X","O","O","X","X","X","O","O"]
        expect(board.tie?).to be(true)
      end
    end

    context "Given full board that has a win condition" do
      it "returns false for the winning type" do
        board.game_board  = ["O","X","X","X","O","X","O","X","O"]
        expect(board.tie?).to be(false)
      end
    end

    context "Given board with no win condition that isnt tied" do
      it "returns false" do
        board.game_board  = ["X", "1", "2", "3", "X", "5", "6", "7", "O"]
        expect(board.tie?).to be(false)
      end
    end
  end

  describe "#available_position?" do
    context "given position that is available" do
      it "returns true" do
        board.game_board  = ["O","X","X","X","4","X","O","X","O"]
        expect(board.available_position?(4)).to be(true)
      end
    end

    context "given position that isnt available" do
      it "returns false" do
        board.game_board  = ["O","X","X","X","O","X","O","X","O"]
        expect(board.available_position?(4)).to be(false)
      end
    end
  end

  describe "#add_turn" do
    it "takes the position and the type and updates the board" do
      board.game_board  = ["O","X","X","X","4","X","O","X","O"]
      board.add_turn(4, "O")
      expect(board.game_board).to eql(["O","X","X","X","O","X","O","X","O"])
    end

    it "doesnt add type if the position isnt available" do
      board.game_board  = ["O","X","X","X","O","X","O","X","O"]
      board.add_turn(4, "X")
      expect(board.game_board).to eql(["O","X","X","X","O","X","O","X","O"])
    end
  end


end
