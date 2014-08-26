require 'board'

class TTTBoard < Board
	# TODO: Generate winning patterns. Do not hardcode
	WINNING_PATTERNS = [0x1c0, 0x38, 0x7, 0x124, 0x92, 0x49, 0x111, 0x54]
	PLAYER_X = 'x'
	PLAYER_O = 'o'
	attr_reader :winner

	# TODO: refactor and simplify code
	def winner?
		[PLAYER_X,PLAYER_O].each do |marker|
			pattern = 0x0
			spaces.each_with_index do |mark, index|
				pattern |= ( 1 << index ) if mark == marker
			end
			WINNING_PATTERNS.each do |winning_pattern|
				if ( pattern & winning_pattern ) == winning_pattern
					@winner = marker
					return true
				end
			end
		end
		false
	end

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
end