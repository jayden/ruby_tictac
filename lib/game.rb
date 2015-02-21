class Game
  attr_reader :board, :human_player, :perfect_player, :user_interface

  def initialize(board, human_player, perfect_player, user_interface)
    @board = board
    @human_player = human_player
    @perfect_player = perfect_player
    @user_interface = user_interface
  end

  def play
    until(@board.draw? or @board.winner?)
      begin
        @user_interface.show_board
        player_turn
      rescue TTTBoard::InvalidMove => ex
        @user_interface.show_message_with_newline(ex.message)
      end
    end
    print_conclusion
  end

  def player_turn
    filled_spaces = @board.spaces
    filled_spaces = filled_spaces.select{|space| space != Board::EMPTY}.size
    if filled_spaces.even?
      get_user_move
    else
      @perfect_player.move
    end
  end

  def get_user_move
    move_selection = @user_interface.ask_for_move.to_i
    human_player.move(move_selection)
  end

  def print_conclusion
    @user_interface.show_board
    @board.draw? ? @user_interface.declare_draw : @user_interface.declare_winner
  end

end
