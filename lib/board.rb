class Board
  attr_accessor :game_board
  def initialize
    @game_board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  def show_board
    puts "\n #{@game_board[0]} | #{@game_board[1]} | #{@game_board[2]} \n===+===+===\n #{@game_board[3]} | #{@game_board[4]} | #{@game_board[5]} \n===+===+===\n #{@game_board[6]} | #{@game_board[7]} | #{@game_board[8]} \n"
  end

  def add_turn(position, type)
    if available_position?(position)
      @game_board[position] = type
    end
  end

  def available_position?(position)
    if @game_board[position] != "X" && @game_board[position] != "O"
      true
    else
      puts "\n That position has already been filled.\nChoose somewhere else\n"
      false
    end
  end

  def victory?(type)
    win_conditions = [
                      [@game_board[0], @game_board[1], @game_board[2]],
                      [@game_board[3], @game_board[4], @game_board[5]],
                      [@game_board[6], @game_board[7], @game_board[8]],
                      [@game_board[0], @game_board[3], @game_board[6]],
                      [@game_board[1], @game_board[4], @game_board[7]],
                      [@game_board[2], @game_board[5], @game_board[8]],
                      [@game_board[0], @game_board[4], @game_board[8]],
                      [@game_board[2], @game_board[4], @game_board[6]]
                     ]

    win_conditions.any? { |win_cond|
      win_cond.all? { |position| position == type  }
    }
  end

  def full_board?
    @game_board.all? { |s| s == "X" || s == "O" }
  end

  def tie?(type)
    full_board? && !victory?(type)
  end

end
