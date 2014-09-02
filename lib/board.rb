class Board
	class InvalidSize < StandardError
	end

	EMPTY = ' '
	attr_reader :spaces, :size

	def initialize(size=9)
		@spaces = []
		@size = size
		raise InvalidSize, "invalid size!" unless valid?
		clear
	end

	def valid?
		sqrt = Math::sqrt(@size)
		return true if (sqrt * sqrt == size)
		false
	end

	def clear
		size.times { spaces.push EMPTY }
	end

	def fill position, marker
		spaces[position] = marker
	end

	def clear_space move
		spaces[move] = EMPTY
	end
end