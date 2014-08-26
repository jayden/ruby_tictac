require 'board_presenter'
require 'board'

describe BoardPresenter do
	let(:col_separator) {"\n-----------\n"}

	it "prints the board" do
		board = Board.new
		expect(BoardPresenter.display(board)).to eql "   |   |   #{col_separator}   |   |   #{col_separator}   |   |   \n\n"
	end

	it "prints a vertical separator at index 0" do
		index = 0
		size = 9
		expect(BoardPresenter.write_separators(index, size)).to eql "|"
	end

	it "determines that index 0 is not the last column of first row" do
		index = 0
		size = 9
		expect(BoardPresenter.last_col?(index, size)).to be false
	end

	it "prints a horizontal separator at index 2" do
		index = 2
		size = 9
		expect(BoardPresenter.write_separators(index, size)).to eql "#{col_separator}"
	end

	it "prints a horizontal separator of length 11 for board size 9" do
		index = 2
		size = 9
		expect(BoardPresenter.print_line(index, size)).to eql col_separator
	end

	it "determines that index 2 is the last column of first row" do
		index = 2
		size = 9
		expect(BoardPresenter.last_col?(index, size)).to be true
	end
end