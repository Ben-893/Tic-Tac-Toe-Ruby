require_relative 'board'

class TicTacToe

  attr_reader :board

  def initialize
  board=Board.new
  @board = board.grid
  @player = true
  end

  def move(slot)
    raise 'Not a valid number' unless slot.is_a? Integer
    raise 'Invalid Slot' if slot > @board.size - 1
    raise 'Slot is in use' if @board[slot] != nil
    @board[slot] = @player
  end
end