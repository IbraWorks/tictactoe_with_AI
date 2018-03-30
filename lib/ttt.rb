require_relative "game_setup.rb"

game = GameSetup.new
game.intro
game.setup_game
game.show_player_order(game.current_game.active_player)
game.begin_game
