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


end
