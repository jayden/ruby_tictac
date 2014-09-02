require 'board_presenter'
require 'board'

describe BoardPresenter do
	let(:col_separator) {"\n-----------\n"}
	let(:size) {9}

	it "prints the board" do
		board = Board.new
		expect(BoardPresenter.display(board)).to eql "   |   |   #{col_separator}   |   |   #{col_separator}   |   |   \n\n"
	end

	it "prints a vertical separator at index 0" do
		expect(BoardPresenter.write_separators(0, size)).to eql "|"
	end

	it "determines that index 0 is not the last column of first row" do
		expect(BoardPresenter.last_col?(0, size)).to be false
	end

	it "prints a horizontal separator at index 2" do
		expect(BoardPresenter.write_separators(2, size)).to eql "#{col_separator}"
	end

	it "prints a horizontal separator of length 11 for board size 9" do
		expect(BoardPresenter.print_line(2, size)).to eql col_separator
	end

	it "determines that index 2 is the last column of first row" do
		expect(BoardPresenter.last_col?(2, size)).to be true
	end
end