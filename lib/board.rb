class Board
	EMPTY = ' '
	attr_accessor :spaces, :size

	def initialize(size=9)
		@spaces = []
		@size = size
		raise Exception unless valid_size?
		clear
	end

	def valid_size?
		sqrt = Math::sqrt(@size)
		return true if (sqrt * sqrt == size)
		false
	end

	def clear
		size.times { spaces.push EMPTY }
	end

	def fill position, marker
		raise Exception if spaces[position] != EMPTY
		spaces[position] = marker
	end
end