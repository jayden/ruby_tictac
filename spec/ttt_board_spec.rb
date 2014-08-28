require 'ttt_board'

describe TTTBoard do
	let(:board) {TTTBoard.new}
	let(:player_o) {'o'}
	let(:player_x) {'x'}
	let(:empty){' '}
	
	let(:winning_patterns) {[0x1c0, 0x38, 0x7, 0x124, 0x92, 0x49, 0x111, 0x54]}
	let(:winning_3x3_rows) {[0x7, 0x38, 0x1c0]}
	let(:winning_4x4_rows) {[0x000f, 0x00f0, 0x0f00, 0xf000]}
	let(:winning_3x3_cols) {[0x49, 0x92, 0x124]}
	let(:winning_4x4_cols) {[0x1111, 0x2222, 0x4444, 0x8888]}
	let(:winning_3x3_diags) {[0x111, 0x54]}
	let(:winning_4x4_diags) {[0x8421, 0x1248]}

	it "acts like a normal board" do
		expect(board).to be_kind_of Board
	end

	it "generates winning row patterns" do
		expect(board.winning_rows).to eql winning_3x3_rows
	end

	it "can also generate winning row patterns for 4x4" do
		board4 = TTTBoard.new(16)
		expect(board4.winning_rows).to eql winning_4x4_rows
	end

	it "generates winning column patterns" do
		expect(board.winning_cols).to eql winning_3x3_cols
	end

	it "can also generate winning row patterns for 4x4" do
		board4 = TTTBoard.new(16)
		expect(board4.winning_cols).to eql winning_4x4_cols
	end

	it "generates winning diagonal patterns" do
		expect(board.winning_diags).to eql winning_3x3_diags
	end

	it "can also generate winning diagonal patterns for 4x4" do
		board4 = TTTBoard.new(16)
		expect(board4.winning_diags).to eql winning_4x4_diags
	end

	context "when there's a winner" do
		it "finds winner in top row" do
			board.fill(0,player_x)
			board.fill(1,player_x)
			board.fill(2,player_x)

			expect(board.winner?).to eql true
		end

		it "finds winner in middle row" do
			board.fill(3,player_x)
			board.fill(4,player_x)
			board.fill(5,player_x)

			expect(board.winner?).to eql true
		end

		it "finds winner in bottom row" do
			board.fill(6,player_x)
			board.fill(7,player_x)
			board.fill(8,player_x)

			expect(board.winner?).to eql true
		end

		it "finds winner in left column" do
			board.fill(0,player_o)
			board.fill(3,player_o)
			board.fill(6,player_o)

			expect(board.winner?).to eql true
		end

		it "finds winner in middle column" do
			board.fill(1,player_o)
			board.fill(4,player_o)
			board.fill(7,player_o)

			expect(board.winner?).to eql true
		end	

		it "finds winner in right column" do
			board.fill(2,player_o)
			board.fill(5,player_o)
			board.fill(8,player_o)

			expect(board.winner?).to eql true
		end	

		it "finds winner in left diagonal" do
			board.fill(0,player_x)
			board.fill(4,player_x)
			board.fill(8,player_x)

			expect(board.winner?).to eql true
		end	

		it "finds winner in right diagonal" do
			board.fill(2,player_o)
			board.fill(4,player_o)
			board.fill(6,player_o)

			expect(board.winner?).to eql true
		end	

		it "can identify the winner" do
			board.fill(0,player_x)
			board.fill(1,player_x)
			board.fill(2,player_x)
			board.winner?

			expect(board.winner).to eql player_x
		end

		it "should return false for no winner" do
			board.fill(0,player_x)
			board.fill(1,player_x)
			board.fill(3,player_x)

			expect(board.winner?).to eql false
		end	
	end

	context "when there may be draw" do
		it "can determine that there's a draw" do
			board.fill(0,player_x)
			board.fill(1,player_o)
			board.fill(2,player_x)
			board.fill(3,player_x)
			board.fill(4,player_o)
			board.fill(5,player_x)
			board.fill(6,player_o)
			board.fill(7,player_x)
			board.fill(8,player_o)

			expect(board.draw?).to eql true
		end

		it "can see that empty spaces mean no draw" do
			expect(board.draw?).to eql false
		end

		it "can see that a winner means no draw" do
			board.fill(0,player_x)
			board.fill(1,player_x)
			board.fill(2,player_x)

			expect(board.draw?).to eql false
		end
	end

	it "returns available moves" do
		board.fill(0, player_x)
		board.fill(1, player_o)
		board.fill(2, player_x)

		expect(board.get_available_moves).to eql [3,4,5,6,7,8]
	end
end