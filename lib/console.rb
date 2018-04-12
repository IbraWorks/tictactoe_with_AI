require "colorize"
class Console
  #handles ui for use in the terminal
  def title
    puts "\n

████████╗██╗ ██████╗    ████████╗ █████╗  ██████╗    ████████╗ ██████╗ ███████╗
╚══██╔══╝██║██╔════╝    ╚══██╔══╝██╔══██╗██╔════╝    ╚══██╔══╝██╔═══██╗██╔════╝
   ██║   ██║██║            ██║   ███████║██║            ██║   ██║   ██║█████╗
   ██║   ██║██║            ██║   ██╔══██║██║            ██║   ██║   ██║██╔══╝
   ██║   ██║╚██████╗       ██║   ██║  ██║╚██████╗       ██║   ╚██████╔╝███████╗
   ╚═╝   ╚═╝ ╚═════╝       ╚═╝   ╚═╝  ╚═╝ ╚═════╝       ╚═╝    ╚═════╝ ╚══════╝
                                                                               \n \n".blue

  end

  def instructions
    puts "Win the game by getting three in a row (vertically, horizontally, or diagonally).\nTo enter your mark on a position, just type in the number matching the position on the\nboard and press enter (e.g, 5 is in the middle, so type 5 then hit enter to go in the middle)."
    puts "Good luck, and have fun!\n\n"
  end

  def whos_turn(player)
    puts "\n\n#{player.name}, it's your turn. please enter an available position:\n ".light_blue
  end

  def computer_message(name)
    puts "#{name} is thinking... ".light_blue
  end

  def vic_message(player)
    puts "\n\nCongratulations #{player.name}, You win!".green
  end

  def tie_message
    puts "\nTic Tac Tie! \n...it took me a week to come up with that pun :'( \n".light_blue
  end

  def show_board(board)
    puts "\n\n #{board.game_board[0]} | #{board.game_board[1]} | #{board.game_board[2]} \n===+===+===\n #{board.game_board[3]} | #{board.game_board[4]} | #{board.game_board[5]} \n===+===+===\n #{board.game_board[6]} | #{board.game_board[7]} | #{board.game_board[8]} \n"
  end

  def out_of_bounds
    puts "\nThat doesn't seem right. Please input a number between 1 and 9\n".red
  end

  def unavailable_position
    puts "\nThat position has already been filled.\nChoose somewhere else\n".red
  end

  def pick_your_type
    puts "\nDo you want to be X or O?\nPlease press 1 for X or 2 for O: \n".light_blue
  end

  def options_error
    puts "Error. Please read the instructions carefully:".red
  end

  def pick_the_players
    puts "\nThere are three options:\nPress 1 for Human vs Human;\nPress 2 for Human vs Computer;\nPress 3 for Computer vs Computer".light_blue
  end

  def get_name
    puts "\nHi first player, what is your name:\n"
  end

  def get_second_name
    puts "And what is the name of your challenger:\n"
  end

  def show_player_order(active_player)
    puts "\n#{active_player.name} will go first. Enter 1 if that's ok, and 2 if you would like to switch the starting player."
  end

  def play_again_message
    puts "\nWould you like to play again?\nPress 1 for yes or 2 for no".light_blue
  end

  def goodbye_message
    puts "\nHope you had fun. Goodbye!".light_blue
  end

  def restart_game_message
    puts "\nOk, let's boot up another game".light_blue
    wait(2)
    puts "Loading... (hire me *cough cough*)".green
    wait(1)
  end

  def wait(seconds)
    sleep(seconds)
  end

end
