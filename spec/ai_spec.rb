require "ai.rb"
require "board.rb"
describe Ai do
  subject(:board){Board.new}
  subject(:ai){Ai.new("X", board, "O", "nil")}

end
