require '../lib/marker'

class Board
	include Marker
	attr_accessor :spaces, :size

	WINNING_PATTERNS = [0x1c0, 0x38, 0x7,
						0x124, 0x92, 0x49,
						0x111, 0x54]

	def initialize(size=9)
		@spaces = []
		@size = size
		clear
	end

	def clear
		size.times { spaces.push Marker::EMPTY }
	end

	def fill position, marker
		raise Exception if spaces[position] != Marker::EMPTY
		spaces[position] = marker
	end

	def isWinner? marker
		pattern = 0x0

		spaces.each_with_index do |mark, index|
			pattern |= ( 1 << index ) if mark == marker
		end

		WINNING_PATTERNS.each do |winning_pattern|
			return true if ( pattern & winning_pattern == winning_pattern )
		end
	end
end