class Player
  attr_reader :name, :player_type, :ui
  def initialize(player_type, ui, name = "Player 1")
    @ui = ui
    @name = name
    @player_type = player_type
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

  def convert_input_to_move(input)
    player_move = input.scan(/[1-9]/).map { |e| e.to_i  }
    valid_input?(player_move) ? player_move : false
  end

  def valid_input?(player_move)
    player_move.length == 1
  end


end
