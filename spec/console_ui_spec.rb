require 'console_ui'
require 'ttt_board'

describe ConsoleUI do
	let(:player_x) {TTTBoard::PLAYER_X}
	let(:col_separator) {"\n-----------\n"}

	before(:each) do
		@board = TTTBoard.new
		@input = StringIO.new
		@output = StringIO.new
		@console_ui = ConsoleUI.new(@board,@input,@output)
	end

	it "has a board" do
		expect(@console_ui).to respond_to(:board)
	end

	it "receieves user input" do
		@input.string = "hello computer!"
		expect(@console_ui.get_input).to eql "hello computer!"
	end

	it "shows output messages" do
		@console_ui.show_message("hello human!")
		expect(@output.string).to eql "hello human!"
	end

	it "shows output messages with newline" do
		@console_ui.show_message_with_newline("hello human!")
		expect(@output.string).to eql "hello human!\n"
	end

	it "asks for player move" do
		@console_ui.ask_for_move
		expect(@output.string).to eql "select a move: "
	end

	it "shows the board" do
		expect(@console_ui).to receive(:show_message).with(TTTBoardPresenter.display(@board))	
		@console_ui.show_board
	end

	it "declares a draw" do
		expect(@console_ui).to receive(:show_message).with("it's a draw!\n")
		@console_ui.declare_draw
	end

	it "declares a winner" do
		@board.fill(0, player_x)
		@board.fill(1, player_x)
		@board.fill(2, player_x)
		@board.winner?

		expect(@console_ui).to receive(:show_message).with("x wins!\n")
		@console_ui.declare_winner
	end
end