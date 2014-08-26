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
		it "should choose center if player chooses an edge" do
			@board.fill(0, player_x)
			@perfect_player.move
			expect(@board.spaces[4]).to eql player_o
		end

		it "should block a winning move" do
			@board.fill(0, player_x)
			@board.fill(4, player_o)
			@board.fill(1, player_x)
			@perfect_player.move

			expect(@board.spaces[2]).to eql player_o
		end

		it "should choose a winning move" do
			@board.fill(0, player_x)
			@board.fill(1, player_o)
			@board.fill(8, player_x)
			@board.fill(7, player_o)
			@board.fill(6, player_x)
			@perfect_player.move
			@board.winner?
			expect(@board.winner).to eql player_o
		end

		it "should choose to win over blocking a winning move" do
			@board.fill(0, player_x)
			@board.fill(4, player_o)
			@board.fill(2, player_x)
			@board.fill(1, player_o)
			@board.fill(6, player_x)
			@perfect_player.move

			expect(@board.spaces[7]).to eql player_o
		end	
	end

end	