require_relative "game_manager.rb"
require "pry"

def run_a_session

  game_manager = GameManager.new(UserInterface.new)
  game_manager.setup_game(game_manager.ui)
  options = game_manager.play_again(game_manager.ui)
  if options == 1
    game_manager.ui.restart_game_message
    run_a_session
  elsif options == 2
    game_manager.ui.goodbye_message
    exit
  end
end

run_a_session
