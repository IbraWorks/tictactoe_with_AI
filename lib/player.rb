class Player
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
    player_move[0]
  end

  private

  def convert_input_to_move(input)
    player_move = input.scan(/[0-8]/).map { |e| e.to_i  }
    #puts "player move : #{player_move}"
    valid_input?(player_move) ? player_move : false
  end

  def valid_input?(player_move)
    player_move.length == 1
  end


end
