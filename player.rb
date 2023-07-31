# frozen_string_literal: true

# represents a tic-tac-toe player
class Player
  attr_accessor :symbol

  def initialize(symbol)
    @symbol = symbol
  end
end
