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

		return available_moves if winner?
		spaces.each_with_index do |move, index|
			available_moves.push(index) if move == EMPTY
		end
		available_moves
	end

	def winner?
		check_for_nil(@winning_combos, Proc.new{@winning_combos = winning_combos})
		[PLAYER_X, PLAYER_O].each do |mark|
			player_positions = spaces.each_index.select{|index| spaces[index] == mark}
			@winning_combos.each do |combo|
				if combo & player_positions == combo
					@winner = mark
					return true
				end
			end
		end
		false
	end

	private
	def check_for_nil(obj, proc)
		proc.call if obj.nil?
	end

	def winning_combos
		winning_rows.concat(winning_cols).concat(winning_diags)
	end

	def winning_rows(winning_rows=[])
		(0..last_space).each_slice(width) do |row|
			winning_rows.push(row)
		end
		winning_rows
	end

	def winning_cols(winning_cols=[])
		(0..last_space_in_row).each do |index|
			winning_cols.push(winning_rows.transpose[index])
		end
		winning_cols
	end

	def winning_diags
		left_diag = (0..last_space_in_row).collect{|i| winning_rows[i][i]}
		reversed_rows = winning_rows.each{|x| x.reverse!}
		right_diag = (0..last_space_in_row).collect{|i| reversed_rows[i][i]}
		return [left_diag,right_diag]
	end
end