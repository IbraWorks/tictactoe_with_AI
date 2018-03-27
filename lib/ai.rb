class Ai
  attr_accessor :name, :type
  def initialize(type, board, opponent, name = "Computer")
    @type = type
    @board = board
    @opp = opponent
    @name = name
  end

  def get_player_move
    spot = nil
    until spot
      if @board.game_board[4] == "4"
        spot = 4
        return spot
      else
        spot = get_best_move(@board)
        if @board.game_board[spot] != "X" && @board.game_board[spot] != "O"
          return spot
        else
          spot = nil
        end
      end
    end
  end
#next_player, depth = 0, best_score = {}
  def get_best_move(board)
    available_spaces = []
    best_move = nil
    board.game_board.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end
    available_spaces.each do |as|
      board.game_board[as.to_i] = @type
      if board.victory?(@type)
        best_move = as.to_i
        board.game_board[as.to_i] = as
        return best_move
      else
        board.game_board[as.to_i] = @opp.type
        if board.victory?(@opp.type)
          best_move = as.to_i
          board.game_board[as.to_i] = as
          return best_move
        else
          board.game_board[as.to_i] = as
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

end
