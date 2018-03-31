class Ai

  attr_reader :name, :type, :ui
  def initialize(type, board, opponent, ui, name = "Computer")
    @type = type
    @board = board
    @opp = opponent
    @ui = ui
    @name = name
  end

  def get_player_move
    @ui.computer_message(@name)
    sleep(1)
    minimax(@board, @type)
    #binding.pry
    @choice
  end

  def minimax(board, current_type, depth = 0)
    return score(board, depth) if board.game_over?
    depth += 1
    scores = {}
    board.available_spaces.each do |move|
      #copy the board so that you dont alter the original state
      possible_board = Marshal.load(Marshal.dump(board))
      possible_board.add_turn(move, current_type)
      scores[move] = minimax(possible_board, switch_types(current_type), depth)
    end

    @choice, best_score = best_move(current_type, scores)
    best_score
  end

  def score(board, depth)
    if board.victory_type == @type
      return 10 - depth
    elsif board.victory_type == @opp
      return depth - 10
    else
      return 0
    end
  end

  def best_move(type, scores)
    if type == @type
      scores.max_by{|k, v| v}
    else
      scores.min_by{|k, v| v}
    end
  end

  def switch_types(type)
    type == @type ? @opp : @type
  end

end


=begin

two methods of attack:
fixing the over? method in board.rb and using current_type instance variable instead
using arrays instead of hashes like the website.


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

=end
