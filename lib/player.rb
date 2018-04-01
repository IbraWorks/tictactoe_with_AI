class Player
  #This class holds player info, and handles input for the player moves.
  attr_reader :name, :type, :ui
  def initialize(type, ui, name = "Player 1")
    @ui = ui
    @name = name
    @type = type
  end

  def get_player_move
    player_move = convert_input_to_move(gets.chomp)
    while !player_move
      @ui.out_of_bounds
      player_move = convert_input_to_move(gets.chomp)
    end
    player_move[0]-1
  end

  private
  #i used regex to handle input rather than simple if statements etc because
  #it got annoying when playing an my fingers would press 1 and a letter by accident
  #so I'd press 1q and get an error message. This way, if I do that the game recognises
  #I meant 1 and the input is handled a bit more gracefully. 
  def convert_input_to_move(input)
    player_move = input.scan(/[1-9]/).map { |e| e.to_i  }
    #puts "player move : #{player_move}"
    valid_input?(player_move) ? player_move : false
  end

  def valid_input?(player_move)
    player_move.length == 1
  end


end
