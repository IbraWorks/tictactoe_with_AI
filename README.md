Instructions to play:

```
$ git clone https://github.com/IvyMic/tictactoe_with_AI.git
$ cd tictactoe_with_AI
$ bundle install
$ ruby lib/ttt.rb

```


To do list:

Write more tests. Some high level integration test? A run of the whole game. A human human case. And human ai case.
Initialize ui in ttt.rb and inject it into gamesetup.
Add some unit tests to test console.
String I/O in ruby to test puts.
Tests in the get player move in ai. Give a predefined board and make sure its making the right move.

Naming: ‘opp’ should be opponent. Cut out abbreviation. Game = GameSetup.new; its not a game, its should be game_setup = GameSetup.new.
Change type to player_type

make some methods private that need to be private.

In ttt.rb game = gamesetup.new; I’ve exposed too much to ttt.rb. It should just calll one method that handles the intro and setup_game and show_player_order etc.



minor feedback:

in the readme install bundler. Write better readme.

Error in the ui: it says pick position between 0-8 instead of 1-9.

cut out the comments (the need for them is a bad sign.)

in gameSetup call it @game instead of @current_game.

Better name for GameSetup. Its like a GameManager.

Extract sleep to the ui. Have a method called wait that calls sleep. And then call ui.wait
