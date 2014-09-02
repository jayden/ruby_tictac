module TTTBoardPresenter
	def self.display(board)
		board_layout = ""

		board.spaces.each_with_index do |space, index|
			board_layout << " #{space} "
			board_layout << write_separators(index, board.size)
		end

		board_layout << "\n\n"
	end 

	def self.write_separators(index, size)
		return last_col?(index, size) ? print_line(index,size) : "|"
	end

	def self.last_col?(index, size)
		board_width = Math::sqrt(size)
		(index+1) % board_width == 0
	end

	def self.print_line(index, size)
		line = '-' * (size + (Math::sqrt(size)-1))
		return print_line?(index, size) ? "\n#{line}\n" : ""
	end

	def self.print_line?(index, size)
		last_col?(index, size) and (index+1) < size
	end
end