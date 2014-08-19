require '../lib/marker'

class Board
	include Marker
	attr_accessor :spaces, :size

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
end