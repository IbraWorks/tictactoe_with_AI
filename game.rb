require_relative "board.rb"
require_relative "player.rb"

class Game
  def initialize
    @board = Board.new
    @com = "X" # the computer's marker
    @hum = Player.new("Player1", "O")
  end

  def start_game
    # start by printing the board
    @board.show_board

    # loop through until the game was won or tied
    until game_is_over(@board.game_board) || tie(@board.game_board)
      player_turn_loop
      if !game_is_over(@board.game_board) && !tie(@board.game_board)
        eval_board
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

  def eval_board
    spot = nil
    until spot
      if @board.game_board[4] == "4"
        spot = 4
        @board.game_board[spot] = @com
      else
        spot = get_best_move(@board.game_board, @com)
        if @board.game_board[spot] != "X" && @board.game_board[spot] != "O"
          @board.game_board[spot] = @com
        else
          spot = nil
        end
      end
    end
  end

  def get_best_move(board, next_player, depth = 0, best_score = {})
    available_spaces = []
    best_move = nil
    board.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end
    available_spaces.each do |as|
      board[as.to_i] = @com
      if game_is_over(board)
        best_move = as.to_i
        board[as.to_i] = as
        return best_move
      else
        board[as.to_i] = @hum.type
        if game_is_over(board)
          best_move = as.to_i
          board[as.to_i] = as
          return best_move
        else
          board[as.to_i] = as
        end
      end
    end
    if best_move
      return best_move
    else
      n = rand(0..available_spaces.count)
      return available_spaces[n].to_i
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
