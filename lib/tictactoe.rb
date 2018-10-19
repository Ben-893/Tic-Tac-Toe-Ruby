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
    raise 'Invalid Slot' if slot > 8
    @board[slot] = @player
  end
end