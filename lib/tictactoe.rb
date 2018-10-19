require_relative 'board'

class TicTacToe

  attr_reader :board

  def initialize
  board=Board.new
  @board = board.grid
  @player = true
  end

  def move(slot)
    raise 'Slot is in use' if @board[slot] != nil
    @board[slot] = @player
  end
end