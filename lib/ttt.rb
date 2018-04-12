require_relative "game_setup.rb"
require "pry"

def run_a_session

  game = GameSetup.new(UserInterface.new)
  game.intro
  game.setup_game
  game.show_player_order(game.current_game.active_player)
  game.begin_game
  options = game.play_again
  if options == 1
    game.ui.restart_game_message
    run_a_session
  elsif options == 2
    game.ui.goodbye_message
    exit
  end
end

run_a_session
