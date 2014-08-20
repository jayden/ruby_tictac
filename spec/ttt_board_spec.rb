require 'ttt_board'

describe TTTBoard do
	let(:board) {TTTBoard.new}
	let(:o) {'o'}
	let(:x) {'x'}
	let(:empty){' '}

	context "when initialized" do
		it "acts like a normal board" do
			expect(board).to be_kind_of Board
		end
	end

	context "when there's a winner" do
		it "finds winner in top row" do
			board.fill(0,x)
			board.fill(1,x)
			board.fill(2,x)

			expect(board.hasWinner?).to eql true
		end

		it "finds winner in middle row" do
			board.fill(3,x)
			board.fill(4,x)
			board.fill(5,x)

			expect(board.hasWinner?).to eql true
		end

		it "finds winner in bottom row" do
			board.fill(6,x)
			board.fill(7,x)
			board.fill(8,x)

			expect(board.hasWinner?).to eql true
		end

		it "finds winner in left column" do
			board.fill(0,o)
			board.fill(3,o)
			board.fill(6,o)

			expect(board.hasWinner?).to eql true
		end

		it "finds winner in middle column" do
			board.fill(1,o)
			board.fill(4,o)
			board.fill(7,o)

			expect(board.hasWinner?).to eql true
		end	

		it "finds winner in right column" do
			board.fill(2,o)
			board.fill(5,o)
			board.fill(8,o)

			expect(board.hasWinner?).to eql true
		end	

		it "finds winner in left diagonal" do
			board.fill(0,x)
			board.fill(4,x)
			board.fill(8,x)

			expect(board.hasWinner?).to eql true
		end	

		it "finds winner in right diagonal" do
			board.fill(2,o)
			board.fill(4,o)
			board.fill(6,o)

			expect(board.hasWinner?).to eql true
		end	

		it "can identify the winner" do
			board.fill(0,x)
			board.fill(1,x)
			board.fill(2,x)
			board.hasWinner?

			expect(board.winner).to eql x
		end

		it "should return false for no winner" do
			board.fill(0,x)
			board.fill(1,x)
			board.fill(3,x)

			expect(board.hasWinner?).to eql false
		end	
	end

	context "when there may be draw" do
		it "can determine that there's a draw" do
			board.fill(0,x)
			board.fill(1,o)
			board.fill(2,x)
			board.fill(3,x)
			board.fill(4,o)
			board.fill(5,x)
			board.fill(6,o)
			board.fill(7,x)
			board.fill(8,o)

			expect(board.isDraw?).to eql true
		end

		it "can see that empty spaces mean no draw" do
			expect(board.isDraw?).to eql false
		end

		it "can see that a winner means no draw" do
			board.fill(0,x)
			board.fill(1,x)
			board.fill(2,x)

			expect(board.isDraw?).to eql false
		end
	end



end