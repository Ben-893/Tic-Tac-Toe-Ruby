require_relative 'board'
require_relative 'player'

class TicTacToe
  WinConditions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  attr_reader :board 

  def initialize
    board = Board.new
    @board = board.grid
    @player = true
    @player_x = Player.new('x')
    @player_o = Player.new('o')
    @current_player = @player_x
  end

  def move(slot)
    raise 'Not a valid number' unless slot =~ /^-?[0-9]+$/
    new_slot = slot.to_i
    raise 'Invalid slot' if new_slot > @board.size - 1
    raise 'Slot is in use' if @board[new_slot] != nil
    @board[new_slot] = @player
  end
end