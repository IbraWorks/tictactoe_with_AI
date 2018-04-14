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
        game_manager.setup_game
        expect(game_manager.board.game_over?).to be(true)
      end
    end

  end
end
