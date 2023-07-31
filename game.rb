# frozen_string_literal: true

require_relative 'game_board'
require_relative 'player'

# the Game class is used to control the game of tic-tac-toe
class Game
  def initialize(player_one, player_two, board)
    @player_one = player_one
    @player_two = player_two
    @board = board
    @player_turn = 1
    @winner = 0
  end

  def play
    find_first
    while @board.empty_spaces.positive?
      is_game_over = turn
      @winner = 1 if is_game_over && @player_turn == 1
      @winner = 2 if is_game_over && @player_turn == 2
      break if is_game_over

      @player_turn == 1 ? @player_turn += 1 : @player_turn -= 1
      @board.empty_spaces -= 1
    end
    end_game
  end

  private

  def turn
    @board.display
    puts @player_turn == 1 ? 'Player 1 turn' : 'Player 2 turn'
    input
    @player_turn == 1 ? check_winner(@player_one) : check_winner(@player_two)
  end

  def end_game
    @board.display
    if @winner.zero?
      puts 'The game is a tie!'
    elsif @winner == 1
      puts 'Player 1 won!'
    else
      puts 'Player 2 won!'
    end
  end

  def find_first
    first_turn = Random.new.rand(2)
    if first_turn.zero?
      @player_turn = 1
      puts 'Player 1 won the coin toss! Player 1 goes first.'
    else
      @player_turn = 2
      puts 'Player 2 won the coin toss! Player 2 goes first.'
    end
  end

  def input
    puts 'Enter the row number: '
    row = Integer(gets.chomp)
    puts 'Enter the column number: '
    col = Integer(gets.chomp)
    @player_turn == 1 ? @board.add(row, col, @player_one.symbol) : @board.add(row, col, @player_two.symbol)
  end

  def check_winner(player)
    results = @board.board.flatten
    return true if results[0] == player.symbol && results[1] == player.symbol && results[2] == player.symbol
    return true if results[3] == player.symbol && results[4] == player.symbol && results[5] == player.symbol
    return true if results[6] == player.symbol && results[7] == player.symbol && results[8] == player.symbol
    return true if results[0] == player.symbol && results[3] == player.symbol && results[6] == player.symbol
    return true if results[1] == player.symbol && results[4] == player.symbol && results[7] == player.symbol
    return true if results[2] == player.symbol && results[5] == player.symbol && results[8] == player.symbol
    return true if results[0] == player.symbol && results[4] == player.symbol && results[8] == player.symbol
    return true if results[2] == player.symbol && results[4] == player.symbol && results[6] == player.symbol

    false
  end
end
