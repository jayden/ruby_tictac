require 'player'
require 'ttt_board'

describe Player do
  let(:player_o) {TTTBoard::PLAYER_O}
  let(:player_x) {TTTBoard::PLAYER_X}
  let(:blank) {TTTBoard::EMPTY}

  before(:each) do
    @board = TTTBoard.new
    @player = Player.new @board, player_x
  end

  context "upon initialization" do
    it "should have a board" do
      expect(@player).to respond_to :board
    end

    it "should be a TicTacToe board" do
      expect(@player.board).to be_kind_of TTTBoard
    end

    it "should be assigned a marker" do
      expect(@player.marker).to  eql player_x
    end

    it "should have an enemy of opposite marker" do
      expect(@player.enemy).to eql player_o
    end
  end
end
