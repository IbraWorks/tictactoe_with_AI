require_relative "ui.rb"
require_relative "game.rb"
class GameSetup
  #this class acts almost as a menu class, setting up the correct mode and settings
  # for the user

  attr_reader :current_game, :ui
  def initialize
    @ui = UserInterface.new
    @board = Board.new
    @current_game = nil
    @type = "X"
  end

  def intro
    @ui.title
    @ui.instructions
  end

  #user selects the type they want to use
  def get_type
    @ui.pick_your_type
    answer = gets.chomp.to_i
    if answer != 1 && answer != 2
      @ui.options_error
      get_type
    end
    answer == 1 ? @type = "X" : @type = "O"
    return @type
  end

  #type for the opponent
  def other_type(type)
    type == "X" ? "O" : "X"
  end

  #user selects the game mode they want to use (hum vs hum, hum vs comp, ai vs ai)
  def get_mode
    @ui.pick_the_players
    mode = gets.chomp.to_i
    if mode != 1 && mode != 2 && mode != 3
      @ui.options_error
      get_mode
    end
    mode
  end

  #gets user's name
  def get_hum_name
    @ui.get_name
    name = gets.chomp.strip
    @ui.options_error if name == ""
    name == "" ? get_hum_name : name
  end

  #get second users name. another method was used for this so that if you wanted
  #to ensure the two users didn't share the same name you could.
  def get_second_name
    @ui.get_second_name
    name = gets.chomp.strip
    @ui.options_error if name == ""
    name == "" ? get_second_name : name
  end

  def setup_game
    case get_mode
    when 1
      @current_game = Game.new(@board, Player.new(get_type, @ui, get_hum_name), Player.new(other_type(@type), @ui, get_second_name))
    when 2
      @current_game = Game.new(@board, Player.new(get_type, @ui, get_hum_name), Ai.new(other_type(@type), @board, @type, @ui))
    when 3
      @current_game = Game.new(@board, Ai.new(@type, @board, other_type(@type), @ui, "HAL 9000"), Ai.new(other_type(@type), @board, @type, @ui, "Skynet"))
    else
      setup_game  #because of our checks before this should never run, but I've been told it's bad practice not to have a default case
    end
  end

  #gives user option to choose who goes first
  def show_player_order(active_player)
    @ui.show_player_order(active_player)
    order = gets.chomp.to_i
    if order != 1 && order != 2
      @ui.options_error
      show_player_order(active_player)
    end
    if order == 2
      @current_game.switch_players
    end
  end

  def begin_game
    @current_game.start_game
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


end
