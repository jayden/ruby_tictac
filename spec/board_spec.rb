require '../lib/board'

describe Board do
	let(:board) {Board.new}
	let(:empty) {' '}
	let(:x) {'x'}
	let(:o) {'o'}

	context "initializing board" do

		it "has a default size" do
			expect(board.size).to eql 9
		end

		it "has a list of spaces" do
			expect(board.spaces).to be_kind_of Array
		end

		it "should be empty" do
			expect(board.spaces).to eql [empty, empty, empty,
										 empty, empty, empty,
										 empty, empty, empty]
		end
	end

	context "filling spaces" do

		it "can fill spaces" do
			expect(board).to respond_to :fill
		end

		it "can fill a specific space" do
			board.fill(0,x)
			expect(board.spaces).to eql [x, empty, empty,
										 empty, empty, empty,
										 empty, empty, empty]
		end

		it "should raise an error if space is occupied" do
			board.fill(0, x)
			expect { board.fill(0,x) }.to raise_error
		end

	end

	context "there's a winner" do
		it "finds winner in top row" do
			board.fill(0,x)
			board.fill(1,x)
			board.fill(2,x)

			expect(board.isWinner? x).to eql true
		end

		it "finds winner in middle row" do
			board.fill(3,x)
			board.fill(4,x)
			board.fill(5,x)

			expect(board.isWinner? x).to eql true
		end

		it "finds winner in bottom row" do
			board.fill(6,x)
			board.fill(7,x)
			board.fill(8,x)

			expect(board.isWinner? x).to eql true
		end

		it "finds winner in left column" do
			board.fill(0,o)
			board.fill(3,o)
			board.fill(6,o)

			expect(board.isWinner? o).to eql true
		end

		it "finds winner in middle column" do
			board.fill(1,o)
			board.fill(4,o)
			board.fill(7,o)

			expect(board.isWinner? o).to eql true
		end	

		it "finds winner in right column" do
			board.fill(2,o)
			board.fill(5,o)
			board.fill(8,o)

			expect(board.isWinner? o).to eql true
		end	

		it "finds winner in left diagonal" do
			board.fill(0,x)
			board.fill(4,x)
			board.fill(8,x)

			expect(board.isWinner? x).to eql true
		end	

		it "finds winner in right diagonal" do
			board.fill(2,o)
			board.fill(4,o)
			board.fill(6,o)

			expect(board.isWinner? o).to eql true
		end			
	end

	it "can determine if there's a draw"
end