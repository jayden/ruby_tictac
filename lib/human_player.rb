require 'player'

class HumanPlayer < Player
  def move(space)
    @board.fill(space, @marker)
  end
end
