require 'board'

class TTTBoard < Board
	WINNING_PATTERNS = [0x1c0, 0x38, 0x7, 0x124, 0x92, 0x49, 0x111, 0x54]
	X = 'x'
	O = 'o'
	attr_accessor :winner

	# TODO: Change method so that it doesn't need marker argument
	def hasWinner?
		[X,O].each do |marker|
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

	def isDraw?
		return false if spaces.include? EMPTY or hasWinner? 
			true
	end


end