require_relative "board.rb"
require_relative "player.rb"
require_relative "ai.rb"

class Game
  def initialize
    @board = Board.new
    @player1 = Player.new("O")
    @player2 = Ai.new("X", @board, @player1) # the ai needs to know about the board and hum's moves
    @active_player = @player1
  end

  def start_game
    # start by printing the board
    loop do
      @board.show_board

      player_turn_loop(@active_player)

      if game_is_over?
        @board.show_board
        break
      end
      switch_players
    end

  end

  private

  def player_turn_loop(active_player)
    loop do
      player_move = active_player.get_player_move
      if @board.add_turn(player_move, active_player.type)
        break
      end
    end
  end

  def game_is_over?
    check_vic? || check_tie?
  end

  def check_tie?
    if @board.tie?(@active_player.type)
      puts "Tic Tac Tie! \n"
      true
    end
  end

  def check_vic?
    if @board.victory?(@active_player.type)
      puts "\n\nCongratulations #{@active_player.name}, you win! Here's How:\n"
      true
    end
  end

  def switch_players
    @active_player == @player1 ? @active_player = @player2 : @active_player = @player1
  end

end

game = Game.new
game.start_game
