
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
    puts "Win the game by getting three in a row (vertically, horizontally, or diagonally)\nTo enter your mark on a position, just type in the number matching the position on the\nboard and press enter (e.g, 5 is in the middle, so type 3 then enter to go in the middle)."
    puts
    puts
    puts "Good luck, and have fun!"
  end

  def whos_turn(player)
    puts "\n#{player.name}, it's your turn. please enter an available position:\n "
  end

  def computer_message(name)
    puts "\n#{name} is thinking... "
  end

  def vic_message(player)
    puts "\nCongratulations #{player.name}, You win!\n"
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

  def pick_your_type
    puts "Do you want to be X or O?\nPlease press 1 for X or 2 for O: \n"
  end

  def options_error
    puts "Error. Please read the instructions carefully: \n"
  end

  def pick_the_players
    puts "\nThere are three options:\n  press 1 for Human vs Human;\n  2 for Human vs Computer;\n  3 for Computer vs Computer"
  end

  def get_name
    puts "Hi Player, what is your name:\n"
  end

  def get_second_name
    puts "And what is the name of your challenger:\n"
  end

  def show_player_order(active_player)
    puts "\n#{active_player.name} will go first. Enter 1 if that's ok, and 2 if you would like to switch the starting player."
  end

  def play_again_message
    puts "\nWould you like to play again?\nPress 1 for yes or 2 for no\n"
  end

  def goodbye_message
    puts "\nHope you had fun. Goodbye!"
  end

  def restart_game_message
    puts "\nOk, let's boot up another game"
    sleep(2)
    puts "Loading... (hire me *cough cough*)"
    sleep(2)
  end

end
