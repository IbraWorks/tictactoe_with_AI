require_relative "ui.rb"
require_relative "game.rb"
class GameSetup
  attr_reader :current_game
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

  def get_type
    @ui.pick_your_type
    answer = gets.chomp.to_i
    unless answer == 1 || answer == 2
      @ui.options_error
      get_type
    end
    answer == 1 ? @type = "X" : @type = "O"
    return @type
  end

  def other_type(type)
    type == "X" ? "O" : "X"
  end

  def get_mode
    @ui.pick_the_players
    mode = gets.chomp.to_i
    unless mode == 1 || mode == 2 || mode == 3
      @ui.options_error
      get_mode
    end
    mode
  end

  def get_hum_name
    @ui.get_name
    name = gets.chomp
    return name
  end

  def get_second_name
    @ui.get_second_name
    name = gets.chomp
    return name
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
      setup_game  #this should never run, but I've been told it's bad practice not to have a default case
    end
  end

  def show_player_order(active_player)
    @ui.show_player_order(active_player)
    order = gets.chomp.to_i
    unless order == 1 || order == 2
      @ui.options_error
      show_player_order
    end
    if order == 2
      @current_game.switch_players
    end
  end

  def begin_game
    @current_game.start_game
  end


end
