require 'board'

describe Board do
  let(:board) {Board.new}
  let(:empty) {' '}
  let(:player_x) {'x'}
  let(:player_o) {'o'}

  context "initializing board" do
    it "has a default size of 9" do
      expect(board.size).to eql 9
    end

    it "will raise an error if provided invalid size" do
      expect {Board.new(7)}.to raise_error Board::InvalidSize
    end

    it "has a list of spaces" do
      expect(board.spaces).to be_kind_of Array
    end

    it "should be empty" do
      expect(board.spaces.uniq).to eql [empty]
    end
  end

  context "filling spaces" do
    it "can fill spaces" do
      expect(board).to respond_to :fill
    end

    it "can fill a specific space" do
      board.fill(0,player_x)
      expect(board.spaces[0]).to eql player_x
    end
  end

  it "should clear one space" do
    board.fill(0, player_x)
    board.clear_space 0

    expect(board.spaces[0]).to eql empty
  end
end
