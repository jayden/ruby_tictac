require 'ttt_board_presenter'
require 'ttt_board'

describe TTTBoardPresenter do
	let(:col_separator) {"\n-----------\n"}
	let(:size) {9}

	it "prints the board" do
		board = TTTBoard.new
		expect(TTTBoardPresenter.display(board)).to eql " 0 | 1 | 2 #{col_separator} 3 | 4 | 5 #{col_separator} 6 | 7 | 8 \n\n"
	end

	it "prints a vertical separator at index 0" do
		expect(TTTBoardPresenter.write_separators(0, size)).to eql "|"
	end

	it "determines that index 0 is not the last column of first row" do
		expect(TTTBoardPresenter.last_col?(0, size)).to be false
	end

	it "prints a horizontal separator at index 2" do
		expect(TTTBoardPresenter.write_separators(2, size)).to eql "#{col_separator}"
	end

	it "prints a horizontal separator of length 11 for board size 9" do
		expect(TTTBoardPresenter.print_line(2, size)).to eql col_separator
	end

	it "determines that index 2 is the last column of first row" do
		expect(TTTBoardPresenter.last_col?(2, size)).to be true
	end
end
