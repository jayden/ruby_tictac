class Player
  attr_accessor :board, :marker, :enemy

  def initialize(board, marker)
    @board = board
    @marker = marker
    @enemy = marker == TTTBoard::PLAYER_X ? TTTBoard::PLAYER_O : TTTBoard::PLAYER_X
  end
end
