require 'player'

INITIAL_DEPTH = 0

class PerfectPlayer < Player
	def move
		minimax(INITIAL_DEPTH, @marker)
		board.fill(@best_move, @marker)
	end

	def minimax(depth, player)
		available_moves = @board.get_available_moves
		depth += 1
		scores = []
		moves = []

		return evaluate_score(depth) if available_moves.length == 0

		available_moves.each do |move|
			@board.fill(move,player)
			next_turn = player == @marker ? @enemy : @marker
			scores << minimax(depth, next_turn)
			moves << move
			@board.clear_space(move)
		end

		best_score(player, scores, moves)
	end

	def best_score(player, scores, moves)
		if player == @marker
			max_score = scores.each_with_index.max[1]
			@best_move = moves[max_score]
			return scores[max_score]
		else
			min_score = scores.each_with_index.min[1]
			@best_move = moves[min_score]
			return scores[min_score]
		end
	end

	def evaluate_score depth
		base_score = @board.size+1
		if @board.winner?
			return @board.winner == @marker ? (base_score-depth) : (depth-base_score)
		else
			return 0
		end
	end

end
