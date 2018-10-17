require_relative 'board'

class TicTacToe

  attr_reader :board

  def initialize()
  @board = board.grid
  @player = true
  end

  def move(slot=0)
    @board[slot] = @player
end