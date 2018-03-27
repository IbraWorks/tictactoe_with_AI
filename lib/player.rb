class Player
  attr_accessor :name, :type
  def initialize(type, name = "Player 1")
    @name = name
    @type = type
  end

  def get_player_move
    puts "\n#{@name}, please enter where you would like to play [0-8]: \n"
    player_move = convert_input_to_move(gets.chomp)
    while !player_move
      puts "That doesn't seem right. \nplease input a number between 0 and 8\n"
      player_move = convert_input_to_move(gets.chomp)
    end
    player_move[0]
  end

  private
  
  def convert_input_to_move(input)
    player_move = input.scan(/[0-8]/).map { |e| e.to_i  }
    puts "player move : #{player_move}"
    valid_input?(player_move) ? player_move : false
  end

  def valid_input?(player_move)
    player_move.length == 1
  end


end
