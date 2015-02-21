$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'game'
require 'ttt_board'
require 'perfect_player'
require 'human_player'
require 'console_ui'

ttt_board = TTTBoard.new
human_player = HumanPlayer.new(ttt_board, TTTBoard::PLAYER_X)
perfect_player = PerfectPlayer.new(ttt_board, TTTBoard::PLAYER_O)
console_ui = ConsoleUI.new(ttt_board)
game = Game.new(ttt_board, human_player, perfect_player, console_ui)
game.play
