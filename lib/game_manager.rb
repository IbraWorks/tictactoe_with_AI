require_relative "ui.rb"
require_relative "game.rb"
class GameManager

  attr_reader :game, :ui, :board
  def initialize(ui)
    @ui = ui
    @board = Board.new
    @game = nil
    @player_type = "X"
  end

  def setup_game(ui)
    intro(ui)
    mode = get_mode(ui)
    setup_game_mode(ui, mode)
    show_player_order(ui, @game.active_player)
    begin_game(ui)
  end

  def play_again(ui)
    ui.play_again_message
    answer = ui.retrieve_input.to_i
    if (answer != 1 && answer != 2)
      ui.options_error
      play_again
    else
      return answer
    end
  end

  private

  def intro(ui)
    ui.title
    ui.instructions
  end

  def setup_game_mode(ui, mode)
    case mode
    when 1
      @game = Game.new(@board, Player.new(get_type(ui), get_hum_name(ui)), Player.new(opponent_type(@player_type), get_second_name(ui)))
    when 2
      @game = Game.new(@board, Player.new(get_type(ui), get_hum_name(ui)), Ai.new(opponent_type(@player_type), @board, @player_type, ui))
    when 3
      @game = Game.new(@board, Ai.new(@player_type, @board, opponent_type(@player_type), "HAL 9000"), Ai.new(opponent_type(@player_type), @board, @player_type, "Skynet"))
    end
  end

  def get_mode(ui)
    ui.pick_the_players
    mode = ui.retrieve_input.to_i
    if mode == 1 || mode == 2 || mode == 3
      return mode
    end
    ui.options_error
    get_mode
  end

  def get_type(ui)
    ui.pick_your_type
    answer = ui.retrieve_input.to_i
    if (answer != 1 && answer != 2)
      ui.options_error
      get_type
    end
    @player_type = "X" if answer == 1
    @player_type = "O" if answer == 2
    @player_type
  end

  def opponent_type(type)
    type == "X" ? "O" : "X"
  end

  def get_hum_name(ui)
    ui.get_name
    name = ui.retrieve_input.strip
    ui.options_error if name == ""
    name == "" ? get_hum_name : name
  end

  def get_second_name(ui)
    ui.get_second_name
    name = ui.retrieve_input.strip
    ui.options_error if name == ""
    name == "" ? get_second_name : name
  end

  def show_player_order(ui, active_player)
    ui.show_player_order(active_player)
    order = ui.retrieve_input.to_i
    if order != 1 && order != 2
      ui.options_error
      show_player_order(ui, active_player)
    end
    if order == 2
      @game.switch_players
    end
  end

  def begin_game(ui)
    @game.start_game(ui)
  end

end
