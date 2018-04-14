require_relative "game_setup.rb"
require "pry"

def run_a_session

  game_setup = GameSetup.new(UserInterface.new)
  game_setup.setup_game
  options = game_setup.play_again
  if options == 1
    game_setup.ui.restart_game_message
    run_a_session
  elsif options == 2
    game_setup.ui.goodbye_message
    exit
  end
end

run_a_session
