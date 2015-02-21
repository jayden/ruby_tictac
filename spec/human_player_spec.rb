require 'human_player'
require 'ttt_board'

describe HumanPlayer do
  let(:player_x) {TTTBoard::PLAYER_X}
  before(:each) do
    @board = TTTBoard.new
    @human_player = HumanPlayer.new @board, player_x
  end
  it "should be a player" do
    expect(@human_player).to be_kind_of Player
  end

  it "should be able to choose a move" do
    @human_player.move 0
    expect(@board.spaces[0]).to eql @human_player.marker
  end
end
