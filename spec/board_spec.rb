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

	it "can fill spaces" do
		expect(board).to respond_to :fill
	end

	context "filling spaces" do

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

	#PENDING
	it "can determine if there's a winner"
	it "can determine if there's a draw"
end