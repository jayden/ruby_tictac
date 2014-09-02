require 'ttt_board_presenter'

class ConsoleUI
	attr_reader :input, :output, :board

	def initialize(board, input=STDIN, output=STDOUT)
		@board = board
		@input = input
		@output = output
	end

	def get_input
		@input.gets
	end

	def show_message(message)
		@output.print message
	end

	def show_message_with_newline(message)
		@output.puts message
	end

	def ask_for_move
		show_message("select a move: ")
		get_input
	end

	def show_board
		show_message(TTTBoardPresenter.display(@board))
	end

	def declare_draw
		show_message("it's a draw!\n")
	end

	def declare_winner
		show_message("#{@board.winner} wins!\n")
	end
end