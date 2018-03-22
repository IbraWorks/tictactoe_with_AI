require_relative "board.rb"
require_relative "player.rb"
require_relative "ai.rb"

class Game
  def initialize
    @board = Board.new
    @hum = Player.new("O")
    @com = Ai.new("X", @board, @hum) # the ai needs to know about the board and hum's moves
    @active_player = @hum
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
    if @board.tie?
      puts "Tic Tac Tie! \n"
      true
    end
  end

  def check_vic?
    if @board.victory?
      puts "\n\nCongratulations #{@active_player.name}, you win! Here's How:\n"
      true
    end
  end

  def switch_players
    @active_player == @hum ? @active_player = @com : @active_player = @hum
  end

end

game = Game.new
game.start_game
