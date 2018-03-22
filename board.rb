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
    end
  end

  def horizontal_vic?
    [@game_board[0], @game_board[1], @game_board[2]].uniq.length == 1 ||
    [@game_board[3], @game_board[4], @game_board[5]].uniq.length == 1 ||
    [@game_board[6], @game_board[7], @game_board[8]].uniq.length == 1
  end

  def vertical_vic?
    [@game_board[0], @game_board[3], @game_board[6]].uniq.length == 1 ||
    [@game_board[1], @game_board[4], @game_board[7]].uniq.length == 1 ||
    [@game_board[2], @game_board[5], @game_board[8]].uniq.length == 1
  end

  def diagonal_vic?
    [@game_board[0], @game_board[4], @game_board[8]].uniq.length == 1 ||
    [@game_board[2], @game_board[4], @game_board[6]].uniq.length == 1
  end

  def victory?
    horizontal_vic? || vertical_vic? || diagonal_vic?
  end

  def tie?
    @game_board.all? { |s| s == "X" || s == "O" }
  end

end
