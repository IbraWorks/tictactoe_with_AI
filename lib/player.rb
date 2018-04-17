class Player
  attr_reader :name, :player_type
  def initialize(player_type, name = "Player 1")
    @name = name
    @player_type = player_type
  end

  def get_player_move(ui)
    player_move = convert_input_to_move(ui.retrieve_input)
    while !player_move
      @ui.out_of_bounds
      player_move = convert_input_to_move(ui.retrieve_input)
    end
    player_move[0]-1
  end

  private

  def convert_input_to_move(input)
    player_move = input.scan(/[1-9]/).map { |e| e.to_i  }
    valid_input?(player_move) ? player_move : false
  end

  def valid_input?(player_move)
    player_move.length == 1
  end


end
