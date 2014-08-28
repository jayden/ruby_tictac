require 'board'

class TTTBoard < Board
	PLAYER_X = 'x'
	PLAYER_O = 'o'
	attr_reader :winner

	def draw?
		return true unless spaces.include? EMPTY or winner? 
			false
	end

	def get_available_moves
		available_moves = []

		if winner?
			return available_moves
		end
		
		spaces.each_with_index do |move, index|
			available_moves.push(index) if move == EMPTY
		end
		available_moves
	end

	# TODO: refactor and simplify code
	def winner?
		[PLAYER_X,PLAYER_O].each do |marker|
			pattern = game_board_pattern_for(marker)
			winning_patterns.each do |winning_pattern|
				if ( pattern & winning_pattern ) == winning_pattern
					@winner = marker
					return true
				end
			end
		end
		false
	end

	#private
	def game_board_pattern_for(marker)
		pattern = 0x0
		spaces.each_with_index do |mark, index|
			pattern |= ( 1 << index ) if mark == marker
		end
		pattern
	end

	def winning_patterns
		(winning_rows << winning_cols << winning_diags).flatten
	end

	def winning_rows
		patterns = []
		(0..last_space).each_slice(width) do |row|
			pattern = find_pattern(row)
			patterns.push(pattern)
		end
		patterns
	end

	def winning_cols
		patterns = []
		column = (0..last_space).select{|index| index % width == 0}

		(0..last_space_in_row).each do |col_num|
			next_column = column.map{|space| space+col_num}
			pattern = find_pattern(next_column)
			patterns.push(pattern)
		end

		patterns
	end

	def winning_diags
		row_arrays = (0..last_space).each_slice(width).to_a
		left_diag = (0..last_space_in_row).collect{|i| row_arrays[i][i]}
		row_arrays.each{|x| x.reverse!}
		right_diag = (0..last_space_in_row).collect{|i| row_arrays[i][i]}
		
		[find_pattern(left_diag), find_pattern(right_diag)]
	end

	def find_pattern(spaces)
		spaces.inject(0x0){|pattern, space| pattern |= 1 << space}
	end
end