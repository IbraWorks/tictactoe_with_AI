require_relative "console.rb"

class UserInterface
  attr_reader :type_of_ui

  def initialize(type_of_ui = Console.new)
    @type_of_ui = type_of_ui
  end

  def instructions
    @type_of_ui.instructions
  end

  def title
    @type_of_ui.title
  end

  def whos_turn(player)
    @type_of_ui.whos_turn(player)
  end

  def computer_message(name)
    @type_of_ui.computer_message(name)
  end

  def vic_message(player)
    @type_of_ui.vic_message(player)
  end

  def tie_message
    @type_of_ui.tie_message
  end

  def show_board(board)
    @type_of_ui.show_board(board)
  end

  def out_of_bounds
    @type_of_ui.out_of_bounds
  end

  def unavailable_position
    @type_of_ui.unavailable_position
  end

  def pick_your_type
    @type_of_ui.pick_your_type
  end

  def options_error
    @type_of_ui.options_error
  end

  def pick_the_players
    @type_of_ui.pick_the_players
  end

  def get_name
    @type_of_ui.get_name
  end

  def get_second_name
    @type_of_ui.get_second_name
  end

  def show_player_order(active_player)
    @type_of_ui.show_player_order(active_player)
  end

  def play_again_message
    @type_of_ui.play_again_message
  end

  def goodbye_message
    @type_of_ui.goodbye_message
  end

  def restart_game_message
    @type_of_ui.restart_game_message
  end

  def wait(seconds)
    @type_of_ui.wait(seconds)
  end

  def retrieve_input
    @type_of_ui.retrieve_input
  end

end
