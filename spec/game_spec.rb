require 'game'
require 'ttt_board'
require 'perfect_player'
require 'human_player'
require 'console_ui'

describe 'Game' do
	let(:player_x) {TTTBoard::PLAYER_X}
	let(:player_o) {TTTBoard::PLAYER_O}
	before(:each) do
		@ttt_board = TTTBoard.new
		@human_player = HumanPlayer.new(@ttt_board, player_x)
		@perfect_player = PerfectPlayer.new(@ttt_board, player_o)
		@user_interface = double
		@test_board = double
		@game = Game.new(@ttt_board, @human_player, @perfect_player, @user_interface)
	end

	it "ends the game and declares a winner" do
		allow(@test_board).to receive(:winner?).and_return([false, false, false, false, true])
		expect(@test_board).to receive(:draw?).twice
		expect(@user_interface).to receive(:show_board).once
		expect(@user_interface).to receive(:declare_winner).once
		test_game = Game.new(@test_board, @human_player, @perfect_player, @user_interface)
		test_game.play
	end

	it "ends the game and declares a draw" do
		allow(@test_board).to receive(:draw?).and_return([false,true])
		expect(@user_interface).to receive(:show_board).once
		expect(@user_interface).to receive(:declare_draw).once
		test_game = Game.new(@test_board, @human_player, @perfect_player, @user_interface)
		test_game.play
	end

	it "lets human take its turn" do
		expect(@user_interface).to receive(:ask_for_move)
		@game.player_turn
	end

	it "switches players and lets computer take its turn" do
		@ttt_board.fill(0, player_x)
		computer = double
		expect(computer).to receive(:move)
	
		test_game = Game.new(@ttt_board, @human_player, computer, @user_interface)
		test_game.player_turn
	end

	it "retrieves human's move" do
		human = double
		expect(@user_interface).to receive(:ask_for_move)
		expect(human).to receive(:move)

		test_game = Game.new(@ttt_board, human, @perfect_player, @user_interface)
		test_game.get_user_move
	end

	it "displays conclusion of a stalemate" do
		draw_board = TTTBoard.new
		draw_board.fill(0,player_x)
		draw_board.fill(1,player_o)
		draw_board.fill(2,player_x)
		draw_board.fill(3,player_o)
		draw_board.fill(5,player_x)
		draw_board.fill(4,player_o)
		draw_board.fill(6,player_x)
		draw_board.fill(7,player_x)
		draw_board.fill(8,player_o)

		expect(@user_interface).to receive(:show_board)
		expect(@user_interface).to receive(:declare_draw)

		draw_game = Game.new(draw_board,@human_player, @perfect_player, @user_interface)
		draw_game.print_conclusion
	end

	it "displays conclusion of a winning game" do
		win_board = TTTBoard.new
		win_board.fill(0,player_x)
		win_board.fill(1,player_o)
		win_board.fill(2,player_x)
		win_board.fill(3,player_o)
		win_board.fill(4,player_o)
		win_board.fill(5,player_x)
		win_board.fill(6,player_x)
		win_board.fill(7,player_o)

		expect(@user_interface).to receive(:show_board)
		expect(@user_interface).to receive(:declare_winner)

		win_game = Game.new(win_board, @human_player, @perfect_player, @user_interface)
		win_game.print_conclusion
	end
end