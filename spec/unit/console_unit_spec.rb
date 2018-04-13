require "console.rb"
require "colorize"

describe Console do
subject(:ui){Console.new}
let(:player){double("player")}
let(:board){double("board")}

before do
  allow(player).to receive(:name).and_return("player 1")
end

  describe "#computer_message" do
    it "says that the computer is thinking" do
      expect{ui.computer_message("computer")}.to output("computer is thinking... \n".light_blue).to_stdout
    end
  end

  describe "#instructions" do
    it "gives the instructions of the game" do
      expect{ui.instructions}.to output("Win the game by getting three in a row (vertically, horizontally, or diagonally).\nTo enter your mark on a position, just type in the number matching the position on the\nboard and press enter (e.g, 5 is in the middle, so type 5 then hit enter to go in the middle). \nGood luck, and have fun!\n\n\n").to_stdout
    end
  end

  describe "#whos_turn" do
    it "lets everyone know whose turn it is" do
      expect{ui.whos_turn(player)}.to output("\n\nplayer 1, it's your turn. please enter an available position:\n\n ".light_blue).to_stdout
    end
  end

  describe "#vic_message" do
    it "congratulates the victorious player" do
      expect{ui.vic_message(player)}.to output("\n\nCongratulations player 1, You win!\n".green).to_stdout
    end
  end

  describe "#tie_message" do
    it "displays the tie message" do
      expect{ui.tie_message}.to output("\nTic Tac Tie! \n...it took me a week to come up with that pun :'( \n\n".light_blue).to_stdout
    end
  end

  describe "#show_board" do
    before do
      allow(board).to receive(:game_board).and_return(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
    end
    it "displays the board" do
      expect{ui.show_board(board)}.to output("\n\n #{board.game_board[0]} | #{board.game_board[1]} | #{board.game_board[2]} \n===+===+===\n #{board.game_board[3]} | #{board.game_board[4]} | #{board.game_board[5]} \n===+===+===\n #{board.game_board[6]} | #{board.game_board[7]} | #{board.game_board[8]} \n\n").to_stdout
    end
  end

  describe "#out_of_bounds" do
    it "displays the out of bounds error message" do
      expect{ui.out_of_bounds}.to output("\nThat doesn't seem right. Please input a number between 1 and 9\n\n".red).to_stdout
    end
  end

  describe "#unavailable_position" do
    it "displays error message for unavailable_position" do
      expect{ui.unavailable_position}.to output("\nThat position has already been filled.\nChoose somewhere else\n\n".red).to_stdout
    end
  end

  describe "#pick_your_type" do
    it "displays message asking user if they want to be X or O" do
      expect{ui.pick_your_type}.to output("\nDo you want to be X or O?\nPlease press 1 for X or 2 for O: \n\n".light_blue).to_stdout
    end
  end

  describe "#options_error" do
    it "displays error message when selecting a false option in game setup" do
      expect{ui.options_error}.to output("Error. Please read the instructions carefully:\n".red).to_stdout
    end
  end

  describe "#pick_the_players" do
    it "displays message for the options of the type of players" do
      expect{ui.pick_the_players}.to output("\nThere are three options:\nPress 1 for Human vs Human;\nPress 2 for Human vs Computer;\nPress 3 for Computer vs Computer\n".light_blue).to_stdout
    end
  end

  describe "#get_name" do
    it "displays message asking for user's name" do
      expect{ui.get_name}.to output("\nHi first player, what is your name:\n\n").to_stdout
    end
  end

  describe "#get_second_name" do
    it "displays message asking for the second user's name" do
      expect{ui.get_second_name}.to output("And what is the name of your challenger:\n\n").to_stdout
    end
  end

  describe "#show_player_order" do
    it "displays message stating which player will go first, and asks user if thats ok" do
      expect{ui.show_player_order(player)}.to output("\nplayer 1 will go first. Enter 1 if that's ok, and 2 if you would like to switch the starting player.\n").to_stdout
    end
  end

  describe "#play_again_message" do
    it "displays message asking if user would like to play again" do
      expect{ui.play_again_message}.to output("\nWould you like to play again?\nPress 1 for yes or 2 for no\n".light_blue).to_stdout
    end
  end

  describe "#goodbye_message" do
    it "displays the goodbye_message to the user" do
      expect{ui.goodbye_message}.to output("\nHope you had fun. Goodbye!\n".light_blue).to_stdout
    end
  end



end
