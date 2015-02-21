require 'board'

class TTTBoard < Board
  class InvalidMove < StandardError
  end

  PLAYER_X = 'x'
  PLAYER_O = 'o'
  attr_reader :winner

  def fill(position, marker)
    raise InvalidMove, "invalid move!" if spaces[position] != EMPTY
    spaces[position] = marker
  end

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
    @winning_combos ||= winning_combos
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
  def winning_combos
    winning_rows.concat(winning_cols).concat(winning_diags)
  end

  def winning_rows
    @winning_rows=[]
    (0..last_space).each_slice(width) do |row|
      @winning_rows.push(row)
    end
    @winning_rows
  end

  def winning_cols(winning_cols=[])
    (0..last_space_in_row).each do |index|
      winning_cols.push(@winning_rows.transpose[index])
    end
    winning_cols
  end

  def winning_diags
    left_diag = get_diags(@winning_rows)
    right_diag = get_diags(@winning_rows.reverse_each.to_a)
    return [left_diag,right_diag]
  end

  def get_diags(array)
    (0..last_space_in_row).collect{|i| array[i][i]}
  end

  def width
    Math::sqrt(size)
  end

  def last_space
    size-1
  end

  def last_space_in_row
    width-1
  end

end
