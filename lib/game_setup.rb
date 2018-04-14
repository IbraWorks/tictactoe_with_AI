require_relative "ui.rb"
require_relative "game.rb"
class GameSetup
  #this class acts almost as a menu class, setting up the correct mode and settings
  # for the user

  attr_reader :game, :ui
  def initialize(ui)
    @ui = ui
    @board = Board.new
    @game = nil
    @player_type = "X"
  end

  def setup_game
    intro
    mode = get_mode
    setup_game_mode(mode)
    show_player_order(@game.active_player)
    begin_game
  end

  #gives user option to play again
  def play_again
    @ui.play_again_message
    answer = gets.chomp.to_i
    if (answer != 1 && answer != 2)
      @ui.options_error
      play_again
    else
      return answer
    end
  end

  private

  def intro
    @ui.title
    @ui.instructions
  end

  def setup_game_mode(mode)
    case mode
    when 1
      @game = Game.new(@board, Player.new(get_type, @ui, get_hum_name), Player.new(opponent_type(@player_type), @ui, get_second_name), @ui)
    when 2
      @game = Game.new(@board, Player.new(get_type, @ui, get_hum_name), Ai.new(opponent_type(@player_type), @board, @player_type, @ui), @ui)
    when 3
      @game = Game.new(@board, Ai.new(@player_type, @board, opponent_type(@player_type), @ui, "HAL 9000"), Ai.new(opponent_type(@player_type), @board, @player_type, @ui, "Skynet"), @ui)
    end
  end

  #user selects the game mode they want to use (hum vs hum, hum vs comp, ai vs ai)
  def get_mode
    @ui.pick_the_players
    mode = gets.chomp.to_i
    if mode == 1 || mode == 2 || mode == 3
      return mode
    end
    @ui.options_error
    get_mode
  end

  #user selects the type they want to use
  def get_type
    @ui.pick_your_type
    answer = gets.chomp.to_i
    if (answer != 1 && answer != 2)
      @ui.options_error
      get_type
    end
    @player_type = "X" if answer == 1
    @player_type = "O" if answer == 2
    @player_type
  end

  def opponent_type(type)
    type == "X" ? "O" : "X"
  end

  def get_hum_name
    @ui.get_name
    name = gets.chomp.strip
    @ui.options_error if name == ""
    name == "" ? get_hum_name : name
  end

  def get_second_name
    @ui.get_second_name
    name = gets.chomp.strip
    @ui.options_error if name == ""
    name == "" ? get_second_name : name
  end

  def show_player_order(active_player)
    @ui.show_player_order(active_player)
    order = gets.chomp.to_i
    if order != 1 && order != 2
      @ui.options_error
      show_player_order(active_player)
    end
    if order == 2
      @game.switch_players
    end
  end

  def begin_game
    @game.start_game
  end

end
