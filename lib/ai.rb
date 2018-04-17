class Ai

  attr_reader :name, :player_type
  def initialize(player_type, board, opponent_type, name = "Computer")
    @player_type = player_type
    @board = board
    @opponent_type = opponent_type
    @name = name
  end

  def get_player_move(ui)
    ui.computer_message(@name)
    ui.wait(1)
    minimax(@board, @player_type)
    @choice
  end

# 'depth' represents the number of turns
# it takes to get the game_over state. the score is adjusted by the depth to ensure that
# the algorithm will prolong the game as much as possible if it is given a rigged
# board and failure is inevitable

  private

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
    if board.victory_type == @player_type
      return 10 - depth
    elsif board.victory_type == @opponent_type
      return depth - 10
    else
      return 0
    end
  end

  def best_move(type, scores)
    if type == @player_type
      scores.max_by{|k, v| v}
    else
      scores.min_by{|k, v| v}
    end
  end

  def switch_types(type)
    type == @player_type ? @opponent_type : @player_type
  end

end
