class Board
  attr_accessor :game_board
  def initialize
    @game_board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
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

  def show_board
    puts "\n #{@game_board[0]} | #{@game_board[1]} | #{@game_board[2]} \n===+===+===\n #{@game_board[3]} | #{@game_board[4]} | #{@game_board[5]} \n===+===+===\n #{@game_board[6]} | #{@game_board[7]} | #{@game_board[8]} \n"
  end

  def add_turn(position, type)
    if available_position?(position)
      @game_board[position] = type
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
    #binding.pry
  end

  def victory_type
    combo = victory_combos
    combo ? @game_board[combo[0]] : false
  end


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
