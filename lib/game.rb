require_relative "board.rb"
require_relative "player.rb"
require_relative "ai.rb"
require_relative "ui.rb"
require "pry"
class Game

  attr_reader :active_player
  def initialize(board, player1, player2, ui)
    @ui = ui
    @board = board
    @player1 = player1
    @player2 = player2
    @active_player = @player1

  end

  def start_game
    loop do
      @ui.show_board(@board)
      @ui.whos_turn(@active_player)
      player_turn_loop(@active_player)
      if finished?
        @ui.show_board(@board)
        @active_player.player_type == @board.victory_type ? @ui.vic_message(@active_player) : @ui.tie_message
        break
      end
      switch_players
    end
  end

  def switch_players
    @active_player == @player1 ? @active_player = @player2 : @active_player = @player1
  end

  private

  def player_turn_loop(active_player)
    loop do
      player_move = active_player.get_player_move
      if @board.add_turn(player_move, active_player.player_type)
        break
      else
        @ui.unavailable_position
      end
    end
  end

  def finished?
    @board.game_over?
  end

end
