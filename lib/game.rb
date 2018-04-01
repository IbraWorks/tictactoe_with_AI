require_relative "board.rb"
require_relative "player.rb"
require_relative "ai.rb"
require_relative "ui.rb"
require "pry"
class Game
  #this class acts like the 'game engine', allowing the user to make a move
  #checking if the game is over and switching players accordingly
  attr_reader :active_player
  def initialize(board, player1, player2)
    @ui = UserInterface.new
    @board = board
    @player1 = player1
    @player2 = player2
    @active_player = @player1
    #binding.pry
  end

  #loop for one match of a game
  def start_game
    # start by printing the board
    loop do
      @ui.show_board(@board)
      @ui.whos_turn(@active_player)
      player_turn_loop(@active_player)
      if finished?
        @ui.show_board(@board)
        @active_player.type == @board.victory_type ? @ui.vic_message(@active_player) : @ui.tie_message
        break
      end
      switch_players
    end
  end

  #loop for getting player move input. will only break once player picks an
  #available_position on the game_board
  def player_turn_loop(active_player)
    loop do
      player_move = active_player.get_player_move
      if @board.add_turn(player_move, active_player.type)
        break
      else
        @ui.unavailable_position
      end
    end
  end

  def finished?
    @board.game_over?
  end

  def switch_players
    @active_player == @player1 ? @active_player = @player2 : @active_player = @player1
  end
end
