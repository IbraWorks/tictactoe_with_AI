
class Console

  def title
    puts "\n

████████╗██╗ ██████╗    ████████╗ █████╗  ██████╗    ████████╗ ██████╗ ███████╗
╚══██╔══╝██║██╔════╝    ╚══██╔══╝██╔══██╗██╔════╝    ╚══██╔══╝██╔═══██╗██╔════╝
   ██║   ██║██║            ██║   ███████║██║            ██║   ██║   ██║█████╗
   ██║   ██║██║            ██║   ██╔══██║██║            ██║   ██║   ██║██╔══╝
   ██║   ██║╚██████╗       ██║   ██║  ██║╚██████╗       ██║   ╚██████╔╝███████╗
   ╚═╝   ╚═╝ ╚═════╝       ╚═╝   ╚═╝  ╚═╝ ╚═════╝       ╚═╝    ╚═════╝ ╚══════╝
                                                                               \n \n"

  end

  def instructions
    puts "Win the game by getting three in a row (vertically, horizontally, or diagonally) \n
    To enter your mark on a position, just type in the number matching the position on the \n
    board and press enter (e.g, 3 is in the middle, so type 3 then enter to go in the middle)."
    puts
    puts
    puts "Good luck, and have fun!"
  end

  def whos_turn(player)
    puts "\n #{player.name}, it's your turn. please enter an available position:\n "
  end

  def vic_message(player)
    puts "\n Congratulations #{player.name}, You win!\n"
  end

  def tie_message
    puts "\nTic Tac Tie! \n...it took me a week to come up with that pun :'( \n"
  end

  def show_board(board)
    puts "\n #{board.game_board[0]} | #{board.game_board[1]} | #{board.game_board[2]} \n===+===+===\n #{board.game_board[3]} | #{board.game_board[4]} | #{board.game_board[5]} \n===+===+===\n #{board.game_board[6]} | #{board.game_board[7]} | #{board.game_board[8]} \n"
  end

  def out_of_bounds
    puts "\nThat doesn't seem right. Please input a number between 0 and 8\n"
  end

  def unavailable_position
    puts "\n That position has already been filled.\nChoose somewhere else\n"
  end

end
