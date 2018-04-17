require "game_manager.rb"

describe GameManager do
  subject(:ui){UserInterface.new}
  subject(:game_manager){GameManager.new(ui)}


  describe "#setup_game" do

    context "in an ai vs ai case" do
      before do
        allow_any_instance_of(IO).to receive(:puts)
        $stdout.stub(:write)
        allow(game_manager).to receive(:get_mode).and_return(3)
        allow(game_manager).to receive(:show_player_order).and_return(1)
      end

      it "plays a game until game is over" do
        game_manager.setup_game(ui)
        expect(game_manager.board.game_over?).to be(true)
      end
    end

    context "in a human vs human case" do
      before do
        $stdout.stub(:write)
        allow(ui).to receive(:retrieve_input).and_return("1","1","Goku","Vegeta","1","1","4","2","5","3")
      end

      it "plays a game until game is over" do
        game_manager.setup_game(ui)
        expect(game_manager.board.game_over?).to be(true)
        expect(game_manager.game.active_player.name).to eql("Goku")
        expect(game_manager.board.game_board).to eql(["X", "X", "X", "O", "O", "6", "7", "8", "9"])
      end
    end

  end
end
