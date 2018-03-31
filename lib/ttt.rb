require_relative "game_setup.rb"
require "pry"

def run_a_session

  game = GameSetup.new
  game.intro
  game.setup_game
  game.show_player_order(game.current_game.active_player)
  game.begin_game
  options = game.play_again
  #binding.pry
  if options == 1
    #puts "test2"
    game.ui.restart_game_message
    run_a_session
  end
  #puts "options: #{options}"
  game.ui.goodbye_message
end

run_a_session
