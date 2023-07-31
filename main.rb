# frozen_string_literal: true

require_relative 'player'
require_relative 'game_board'
require_relative 'game'

player_one = Player.new('X')
player_two = Player.new('O')
board = GameBoard.new
game = Game.new(player_one, player_two, board)
game.play
