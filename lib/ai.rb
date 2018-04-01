class Ai
  #Ai class handles the logical approach the computer makes when choosing
  #where to play
  #Ai uses minimax algorithm to ensure it always wins or at least draws
  #it iterates through all the best potential moves (for both players) and
  #gives each a weight, depending on if the final game-state results
  #in a loss/draw/win for the ai, picking the most optimal choice for the ai.
  attr_reader :name, :type
  def initialize(type, board, opponent, ui, name = "Computer")
    @type = type
    @board = board
    @opp = opponent #opponent's type
    @ui = ui
    @name = name
  end

  def get_player_move
    @ui.computer_message(@name)
    sleep(1)
    minimax(@board, @type)
    @choice
  end
=begin
with a rigged board, where the ai is destined to lose, the algorithm doesn't
pick the best move possible and delay the inevitable. essentially, if all potential
moves eventually result in a loss for the ai then they all carry the same score,
and therefore the algorithm wont care about delaying the inevitable and picking
the obvious move to delay the loss. 'depth' represents the number of turns
it takes to get the game_over state. the score is adjusted by the depth to ensure that
the algorithm will prolong the game as much as possible if it is given a rigged
board and failure is inevitable
=end
  def minimax(board, current_type, depth = 0)
    return score(board, depth) if board.game_over?
    depth += 1
    scores = {}
    board.available_spaces.each do |move|
      #copy the board so that you dont alter the original state
      #uses object marshalling to create a deep clone of the @board instance
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
  I left the previous ai code here commented out because it could potentially
  be used as a 'medium' mode when challenging the computer. It's good but doesnt
  guarantee the Ai will always win/draw.

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
