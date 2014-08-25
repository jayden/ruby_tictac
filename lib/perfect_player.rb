require 'player'

INITIAL_DEPTH = 0
INITIAL_BEST_MOVE = 9
MIN_VALUE = -100000
MAX_VALUE = 100000

class PerfectPlayer < Player
def move
		best_score_and_move = minimax(INITIAL_DEPTH, @marker)
		@board.fill(best_score_and_move[1], @marker)
	end

	# TODO: Refactor
	def minimax(depth, player)
		available_moves = @board.get_available_moves

		best_score  = (player == @marker) ? MIN_VALUE : MAX_VALUE
		best_move = INITIAL_BEST_MOVE
		current_score = 0

		if available_moves.length == 0
			best_score = evaluate_score(depth)
		else
			available_moves.each do |move|
				@board.fill(move, player)
				if player == @marker
					current_score = minimax(depth+1, @enemy)[0]
					if current_score > best_score
						best_score = current_score
						best_move = move
					end
				else
					current_score = minimax(depth+1, @marker)[0]
					if current_score < best_score
						best_score = current_score
						best_move = move
					end
				end
				undo(move)
			end
		end
		return [best_score, best_move]
	end

	def evaluate_score depth
		base_score = 10
		if @board.winner?
			return base_score - depth if @board.winner == @marker
			return depth - base_score if @board.winner == @enemy
		else
			return 0
		end
	end

	def undo move
		@board.clear_space move
	end

end
