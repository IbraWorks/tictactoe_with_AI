require_relative "board.rb"
require_relative "player.rb"
require_relative "ai.rb"
require "pry"
class Game

  def initialize
    @board = Board.new
    @player1 = Player.new("O")
    @player2 = Ai.new("X", @board, @player1.type) # the ai needs to know about the board and hum's moves
    @active_player = @player1
  end

  def start_game
    # start by printing the board
    loop do
      @board.show_board

      player_turn_loop(@active_player)

      if finished?
        @board.show_board
        @active_player.type == @board.victory_type ? vic_message(@active_player) : tie_message
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
      end
    end
  end

  def finished?
    @board.game_over?
  end

  def vic_message(active_player)
    puts "\ncongrats #{active_player.name}, you win!\n"
  end

  def tie_message
    puts "\n Tic Tac Tie! \n"
  end

  def switch_players
    @active_player == @player1 ? @active_player = @player2 : @active_player = @player1
  end

end

game = Game.new
game.start_game
