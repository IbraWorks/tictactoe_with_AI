class Board
  attr_accessor :game_board
  def initialize
    @game_board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  WIN_CONDITIONS = [
                    [0,1,2],
                    [3,4,5],
                    [6,7,8],
                    [0,3,6],
                    [1,4,7],
                    [2,5,8],
                    [0,4,8],
                    [2,4,6]
                   ]

  def add_turn(position, player_type)
    if available_position?(position)
      @game_board[position] = player_type
    end
  end

  def available_spaces
    as = []
    @game_board.each_index do |i|
      as << i if available_position?(i)
    end
    as
  end

  def game_over?
    victory? || tie?
  end

  def victory_type
    combo = victory_combos
    combo ? @game_board[combo[0]] : false
  end

  private

  def victory_combos
    WIN_CONDITIONS.each { |cond|
      if @game_board[cond[0]] == @game_board[cond[1]] && @game_board[cond[1]] == @game_board[cond[2]]
        return cond unless @game_board[cond[0]] != "X" && @game_board[cond[0]] != "O"
      end
    }
    false
  end

  def available_position?(position)
    @game_board[position] != "X" && @game_board[position] != "O"
  end

  def tie?
    !victory? && available_spaces.empty?
  end

  def victory?
    combo = victory_combos
    combo ? true : false
  end

end
