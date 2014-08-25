require 'perfect_player'
require 'ttt_board'

describe PerfectPlayer do
	let(:player_o) {TTTBoard::PLAYER_O}
	let(:player_x) {TTTBoard::PLAYER_X}
	before(:each) do
		@board = TTTBoard.new
		@perfect_player = PerfectPlayer.new @board, player_o
	end

	it "should act like a player" do
		expect(@perfect_player).to be_kind_of Player
	end

	it "has an enemy of opposite marker" do
		expect(@perfect_player.enemy).to eql player_x
	end

	it "should be able to undo a move" do
		@board.fill(0, player_x)
		@perfect_player.undo 0
		expect(@board.spaces[0]).to eql Board::EMPTY
	end

	context "when deciding on a move" do
		it "should choose center if player chooses top-left edge" do
			@board.fill(0, player_x)
			@perfect_player.move
			expect(@board.spaces[4]).to eql player_o
		end

		it "should choose center if player chooses top-right edge" do
			@board.fill(2, player_x)
			@perfect_player.move
			expect(@board.spaces[4]).to eql player_o
		end

		it "should choose center if player chooses bottom-left edge" do
			@board.fill(6, player_x)
			@perfect_player.move
			expect(@board.spaces[4]).to eql player_o
		end

		it "should choose center if player chooses bottom-right edge" do
			@board.fill(8, player_x)
			@perfect_player.move
			expect(@board.spaces[4]).to eql player_o
		end
	end

end	