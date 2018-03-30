require_relative "board.rb"
require_relative "player.rb"
require_relative "ai.rb"
require_relative "ui.rb"
require "pry"
class Game

  def initialize
    @ui = UserInterface.new
    @board = Board.new
    @player1 = Player.new("O", @ui)
    @player2 = Ai.new("X", @board, @player1.type, @ui) # the ai needs to know about the board and hum's moves
    @active_player = @player1
  end

  def start_game

    # start by printing the board
    loop do
      @board.show_board
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

game = Game.new
game.start_game
