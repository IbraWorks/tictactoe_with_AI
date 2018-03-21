require_relative "board.rb"
require_relative "player.rb"
require_relative "ai.rb"
class Game
  def initialize
    @board = Board.new
    @hum = Player.new("O")
    @com = Ai.new("X", @board, @hum) # the ai needs to know about the board and hum's moves

  end

  def start_game
    # start by printing the board
    @board.show_board

    # loop through until the game was won or tied
    until game_is_over(@board.game_board) || tie(@board.game_board)
      player_turn_loop
      if !game_is_over(@board.game_board) && !tie(@board.game_board)
        @com.eval_board
      end
    @board.show_board
    end
    puts "Game over"
  end

  def player_turn_loop
    loop do
      player_move = @hum.get_player_move
      if @board.add_turn(player_move, @hum.type)
        break
      end
    end
  end

  def game_is_over(b)

    [b[0], b[1], b[2]].uniq.length == 1 ||
    [b[3], b[4], b[5]].uniq.length == 1 ||
    [b[6], b[7], b[8]].uniq.length == 1 ||
    [b[0], b[3], b[6]].uniq.length == 1 ||
    [b[1], b[4], b[7]].uniq.length == 1 ||
    [b[2], b[5], b[8]].uniq.length == 1 ||
    [b[0], b[4], b[8]].uniq.length == 1 ||
    [b[2], b[4], b[6]].uniq.length == 1
  end

  def tie(b)
    b.all? { |s| s == "X" || s == "O" }
  end

end

game = Game.new
game.start_game
