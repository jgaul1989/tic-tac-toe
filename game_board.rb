# frozen_string_literal: true

# the tic-tac-toe game board
class GameBoard
  attr_reader :board
  attr_accessor :empty_spaces

  def initialize
    @board = Array.new(3) { Array.new(3, 'E') }
    self.empty_spaces = 9
  end

  def display
    @board.each do |row|
      p row
    end
    puts "\n"
  end

  def add(row, column, symbol)
    @board[row][column] = symbol
  end
end
